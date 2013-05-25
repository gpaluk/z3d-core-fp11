package z3d.controllers 
{
	import z3d.scenegraph.ControlledObject;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Controller 
	{
		
		public var controlledObject: ControlledObject;
		
		public function update( dt: Number ): void
		{
			throw new Error( "Update is a virtual method." );
		}
		
	}

}