package z3d.constants 
{
	import flash.geom.Matrix3D;
	import z3d.geometry.TriMesh;
	import z3d.scenegraph.Camera;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class PVWMatrixConstant 
	{
		
		protected var _mesh: TriMesh;
		protected var _camera: Camera;
		
		public function PVWMatrixConstant( mesh: TriMesh, camera: Camera) 
		{
			_mesh = mesh;
			_camera = camera;
		}
		
		public function get data(): Matrix3D
		{
			var w: Matrix3D = _mesh.worldTransform.clone();
			var v: Matrix3D = _camera.view.clone();
			var p: Matrix3D = _camera.proj.clone();
			
			w.append( v );
			w.append( p );
			
			return w;
		}
		
	}

}