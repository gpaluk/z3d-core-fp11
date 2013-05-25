package z3d.renderer 
{
	import flash.display.Stage;
	import flash.display3D.Context3D;
	import flash.display3D.Context3DProgramType;
	import flash.display3D.Context3DVertexBufferFormat;
	import z3d.constants.PVWMatrixConstant;
	import z3d.context.Context3DContext;
	import z3d.context.StageContext;
	import z3d.geometry.TriMesh;
	import z3d.scenegraph.Camera;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class Renderer 
	{
		
		protected var _renderableObjects: Vector.<TriMesh>;
		protected var _camera: Camera;
		protected var _context3D: Context3D;
		protected var _stage: Stage;
		
		public function Renderer( camera: Camera ) 
		{
			_renderableObjects = new Vector.<TriMesh>();
			_camera = camera;
			_context3D = Context3DContext.context;
			_stage = StageContext.context;
			initRenderer();
		}
		
		private function initRenderer(): void
		{
			_context3D.configureBackBuffer( _stage.stageWidth, _stage.stageHeight, 2, true );
		}
		
		public function addRenderable( m: TriMesh ): void
		{
			_renderableObjects.push( m );
		}
		
		public function render( ): void
		{
			_context3D.clear( 0, 0, 0, 0 );
			for each( var m: TriMesh in _renderableObjects )
			{
				_context3D.setTextureAt( 1, m.texture );
				_context3D.setProgram( m.program );
				_context3D.setVertexBufferAt( 0, m.vertexBuffer, 0, Context3DVertexBufferFormat.FLOAT_3 );
				_context3D.setVertexBufferAt( 1, m.vertexBuffer, 3, Context3DVertexBufferFormat.FLOAT_2 );
				
				var constant: PVWMatrixConstant = new PVWMatrixConstant( m, _camera );
				_context3D.setProgramConstantsFromMatrix( Context3DProgramType.VERTEX, 0, constant.data, true );
				
				_context3D.drawTriangles( m.indexBuffer );
				
				_context3D.setProgram( null );
				_context3D.setTextureAt( 1, null );
			}
			_context3D.present();
		}
		
	}

}