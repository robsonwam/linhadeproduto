package br.ufpe.cin.reuso.model.persistence.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.hibernate.CacheMode;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;

import br.ufpe.cin.reuso.model.persistence.interfaces.IRegister;
import br.ufpe.cin.reuso.util.EntityManagerFactoryCreate;


@SuppressWarnings("unchecked")
public abstract class GenericDAO<T> implements IRegister<T> {
	private EntityManager em;
	private Class classePersistente;

	/** * Contrutor que guarda o tipo atual da classe T. */
	protected GenericDAO(Class classePersistente) {
		this.classePersistente = classePersistente;
		this.em = EntityManagerFactoryCreate.getInstance().getEm();
	}
	/*
	 * Digamos que você tenha recuperado sua lista de cidades como: 
	 * List<Cidade> cidades = query.list();  
	 * e que a classe Cidade tenha o campo "nome". Para ordenar você mesmo (sem depender do banco de dados) as cidades recebidas, você pode usar: 
	 *  List<Cidade> cidadesOrdenadas = new ArrayList<Cidade>(cidades);  
	 * final Collator ordenarIgnorandoAcentos = Collator.getInstance (new Locale ("pt", "BR"));  
	 * ordenarIgnorandoAcentos.setStrength (Collator.PRIMARY);  
	 * Collections.sort (cidadesOrdenadas, new Comparator<Cidade>() {  
	 *     public int compare (Cidade c1, Cidade c2) {  
	 *         return ordenarIgnorandoAcentos.compare (c1.getNome(), c2.getNome());  
	 *     }  
	 * });  
	 * 
	 * */
	public final void begin() {
		em.getTransaction().begin();
	}

	public final void commit() {
		em.getTransaction().commit();
	}
	
	public final void rollback() {
		em.getTransaction().rollback();
	}

	/**
	 * * Atualiza o objeto que se encontra em memória. * * @param object *
	 * objeto a ser atualizado
	 */
	public final void refresh(T object) {
		getEntityManager().refresh(object);
	}

	/** * Executa o flush no entity manager. * */
	public final void flush() {
		getEntityManager().flush();
	}

	/** * Executa o flush no entity manager. * */
	public final void clear() {
		flush();
		getEntityManager().clear();
	}

	/**
	 * * Executa o merge do objeto que se encontra em memória. * * @param objeto
	 * * a ser realizado o merge * @return objeto que foi executado o merge
	 */
	public final T merge(T objeto) {
		objeto = getEntityManager().merge(objeto);
		return objeto;
	}

	/** * Salva o objeto atual na base de dados. * * @param objeto * a ser salvo */
	public final void salvar(T objeto) {
		getEntityManager().persist(objeto);
	}

	/** * Remove o objeto da base de dados. * * @param objeto * a ser removido */
	public final void remover(T objeto) {
		Object obj = getEntityManager().merge(objeto);
		getEntityManager().remove(obj);
	}

	/**
	 * * Remove o objeto uma vez passado sua chave como parâmetro. * * @param
	 * chave * identificadora do objeto
	 */
	public final void removerPorChave(Integer chave) {
		Query query = getEntityManager().createQuery(
				"delete from " + getClassePersistente().getName()
				+ " where id = " + chave);
		query.setHint("org.hibernate.cacheMode", CacheMode.REFRESH);
		query.executeUpdate();
	}

	/**
	 * * Busca o objeto uma vez passado sua chave como parâmetro. * * @param
	 * chave * identificador * @return Objeto do tipo T
	 */
	public T buscarPorChave(Object chave) {
		T instance = null;
		try {
			instance = (T) getEntityManager().find(getClassePersistente(),
					chave);
		} catch (RuntimeException re) {
			re.printStackTrace();
		}
		return instance;
	}

	/**
	 * * Busca o objeto de acordo com o objeto preenchido com os valores passado
	 * * como exemplo. * * @param objeto * utilizado para realizar a busca * @param
	 * ordenacoes * lista de critérios de ordenação * @return Lista de objetos
	 * retornada
	 */
	public List buscarPorExemplo(T objeto, Order... ordenacoes) {
		Session session = (Session) getEntityManager().getDelegate();
//		session.setCacheMode(CacheMode.REFRESH);
		Example example = criaExemplo(objeto);
		Criteria criteria = session.createCriteria(objeto.getClass()).add(
				example);
		for (int i = 0; i < ordenacoes.length; i++) {
			criteria.addOrder((org.hibernate.criterion.Order) ordenacoes[i]);
		}
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return (List) criteria.list();
	}	
	
	/**
	 * * Busca o objeto de acordo com o objeto preenchido com os valores passado
	 * * como exemplo. * * @param objeto * @param indiceInicial * @param
	 * indiceFinal * @param ordenacoes * lista de critérios de ordenação. * @return
	 * Lista de orden
	 */
	public final List buscarPorExemplo(T objeto, Integer indiceInicial,
			Integer indiceFinal, Order... ordenacoes) {
		Example example = criaExemplo(objeto);
		Criteria criteria = criaCriteria().add(example);
		criteria.setFirstResult(indiceInicial);
		criteria.setMaxResults(indiceFinal);
		for (int i = 0; i < ordenacoes.length; i++) {
			criteria.addOrder((org.hibernate.criterion.Order) ordenacoes[i]);
		}
		return (List) criteria.list();
	}

	/**
	 * * Retorna a quantidade total de objetos para aquela entidade específica.
	 * * * @return quantidade total de objetos
	 */
	public final int buscaQuantidadeTotal() {
		Criteria criteria = criaCriteria();
		criteria.setProjection(Projections.rowCount());
		return (Integer) criteria.uniqueResult();
	}

	/**
	 * * Busca todos os objetos para aquela entidade específica. * * @param
	 * ordenacoes * lista de ordenações para pesquisa * @return lista de todos
	 * os objetos da entidade
	 */
	public List buscarTodos(Order... ordenacoes) {
		List results = null;
		try {
			Query query = getEntityManager().createQuery(
					"from " + getClassePersistente().getName()
					+ adicionaOrderByHql(ordenacoes));
			query.setHint("org.hibernate.cacheMode", CacheMode.REFRESH);
			results = query.getResultList();
		} catch (RuntimeException re) {
			re.printStackTrace();
		}
		return results;
	}

	/**
	 * * * Busca todos os objetos de uma entidade específica de um índice
	 * inicial * até um índice final. * * @param indiceInicial * indice inicial
	 * da busca * @param indiceFinal * indice final da pesquisa. * @param
	 * ordenacoes * lista de ordenação a ser criado * @return uma lista de
	 * objetos do tipo T
	 */
	public List buscarTodos(Integer indiceInicial, Integer indiceFinal,
			Order... ordenacoes) {
		List results = null;
		try {
			Query query = getEntityManager().createQuery(
					"from " + getClassePersistente().getName()
					+ adicionaOrderByHql(ordenacoes));
			query.setFirstResult(indiceInicial);
			query.setMaxResults(indiceFinal);
			results = (List) query.getResultList();
		} catch (RuntimeException re) {
			re.printStackTrace();
		}
		return results;
	}

	/**
	 * * Utilizado para se injetar o Entity manager no DAO. * * @param
	 * entityManager * entity manager
	 */
	public void setEntityManager(EntityManager entityManager) {
		this.em = entityManager;
	}

	/**
	 * * Utilizado para se utilizar o entity manager nos DAOS que herdam do DAO
	 * * genérico. * * @return Entity manager.
	 */
	protected EntityManager getEntityManager() {
		return em;
	}

	/**
	 * * Adiciona o orderBy no final da query a ser utilizada. * * @param
	 * ordenacoes * a serem utilizadas para a busca * @return string com o
	 * orderBy
	 */
	protected final static String adicionaOrderByHql(Order... ordenacoes) {
		String result = "";
		if (ordenacoes.length > 0) {
			StringBuilder builder = new StringBuilder(" order by ");
			for (int i = 0; i < ordenacoes.length - 1; i++) {
				builder.append(ordenacoes[i].toString());
				builder.append(", ");
			}
			builder.append(ordenacoes[ordenacoes.length - 1]);
			result = builder.toString();
		}
		return result;
	}

	/**
	 * * Busca a classe persistente do objeto utilizado na classe. * * @return
	 * classe persistente
	 */
	protected final Class getClassePersistente() {
		return classePersistente;
	}

	/**
	 * * Retorna o objeto da clases Criteria. * * @return um objeto do tipo
	 * Criteria do Hibernate
	 */
	protected final Criteria criaCriteria() {
		Session session = (Session) getEntityManager().getDelegate();
//		session.setCacheMode(CacheMode.REFRESH);
		return session.createCriteria(getClassePersistente());
	}

	/**
	 * * Método utilizado para criar o objeto Example. Este objeto é utilizado *
	 * para realizar a busca por exemplo. * * @param objeto * sobre o qual o
	 * Example será criado * @return em objeto do tipo Example
	 */
	protected final Example criaExemplo(T objeto) {
		Example example = Example.create(objeto);
		example.enableLike(MatchMode.ANYWHERE);
		example.excludeZeroes();
		example.ignoreCase();
		return example;
	}
}