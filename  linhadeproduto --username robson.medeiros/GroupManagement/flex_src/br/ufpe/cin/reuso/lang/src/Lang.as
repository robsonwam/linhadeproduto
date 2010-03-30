package br.ufpe.cin.reuso.lang.src
{
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import mx.collections.XMLListCollection;

    public class Lang
    {
        [Bindable]
        public var xml:XMLList;

        public function getLang(idioma:String):void
        {
            var request:URLLoader = new URLLoader();
            request.addEventListener(Event.COMPLETE, setLang);
            request.load(new URLRequest("br/ufpe/cin/reuso/lang/" + idioma + ".xml"));
        }

        public function setLang(e:Event):void
        {
            xml = new XMLList(e.target.data);
        }

    }
}