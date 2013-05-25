package z3d.scenegraph 
{
	import com.adobe.utils.PerspectiveMatrix3D;
	import flash.geom.Matrix3D;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Camera 
	{
		public var view: Matrix3D;
		public var proj: PerspectiveMatrix3D;
		
		public function Camera() 
		{
			view = new Matrix3D();
			view.appendTranslation( 0, 0, 5 );
			proj = new PerspectiveMatrix3D();
			proj.perspectiveFieldOfViewLH( 40 * (Math.PI/180), 800/600, 0.1, 100 );
		}
		
	}

}