package z3d.scenegraph 
{
	import z3d.controllers.Controller;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class ControlledObject 
	{
		
		protected var _controllers:Vector.<Controller>
		
		public function ControlledObject() 
		{
			_controllers = new Vector.<Controller>();
		}
		
		public function addController( c: Controller ): void
		{
			c.controlledObject = this;
			_controllers.push( c );
		}
		
		public function updateControllers( dt: Number ): void
		{
			for each( var c: Controller in _controllers )
			{
				c.update( dt );
			}
		}
		
	}

}