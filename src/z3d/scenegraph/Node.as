package z3d.scenegraph 
{
	import flash.geom.Matrix3D;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Node extends ControlledObject 
	{
		
		protected var _parent: Node;
		protected var _children: Vector.<Node>;
		
		public var worldTransform:Matrix3D;
		public var localTransform:Matrix3D;
		
		public function Node() 
		{
			_children = new Vector.<Node>();
			worldTransform = new Matrix3D();
			localTransform = new Matrix3D();
		}
		
		public function addChild( n: Node ): void
		{
			n._parent = this;
			_children.push( n );
		}
		
		public function update( dt: Number ): void
		{
			updateControllers( dt );
			if ( _parent )
			{
				var m: Matrix3D = _parent.worldTransform.clone();
				m.append( localTransform );
				worldTransform = m;
			}
			else
			{
				worldTransform = localTransform;
			}
			for each( var c: Node in _children )
			{
				c.update( dt );
			}
		}
		
	}

}