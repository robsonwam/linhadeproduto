package br.com.r2jm.sauderesidencia.view.components
{
	import mx.collections.IViewCursor;
	import mx.controls.ComboBox;

	public class ComboBoxFindSelected extends ComboBox
	{
		public function ComboBoxFindSelected()
		{
			super();
		}

		override public function set selectedItem( value:Object ):void
		{
			super.selectedItem = value;

			if (( value is String ) || ( value is Number ) || ( value is int ) || ( value is uint ) || ( value is Date ) || ( value is Boolean ))
			{
				this.selectedData( value );
			}
			else
			{
				this.selectedObject( value );
			}

		}

		private function selectedObject( value:Object ):void
		{
			super.selectedItem = value;

			if ( value != null && selectedIndex == -1 )
			{
				// do a painful search;
				if ( collection && collection.length )
				{
					var cursor:IViewCursor = collection.createCursor();

					while ( !cursor.afterLast )
					{
						var obj:Object = cursor.current;
						var nope:Boolean = false;

						for ( var p:String in value )
						{
							if ( obj[ p ] !== value[ p ])
							{
								nope = true;
								break;
							}
						}

						if ( !nope )
						{
							super.selectedItem = obj;
							return;
						}
						cursor.moveNext();
					}
				}
			}
		}

		private function selectedData( value:Object ):void
		{
			if ( value != null && selectedIndex == -1 )
			{
				// do a painful search;
				if ( collection && collection.length )
				{
					var cursor:IViewCursor = collection.createCursor();

					while ( !cursor.afterLast )
					{
						var obj:Object = cursor.current;

						try
						{
							if ( obj.data != null )
							{
								if ( obj.data.toString().toUpperCase() == value.toString().toUpperCase())
								{
									super.selectedItem = obj;
									break;
								}
							}
						}
						catch ( e:Error )
						{

						}
						cursor.moveNext();
					}
				}
			}
		}

	}
}