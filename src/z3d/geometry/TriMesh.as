package z3d.geometry 
{
	import com.adobe.utils.AGALMiniAssembler;
	import flash.display3D.Context3D;
	import flash.display3D.Context3DProgramType;
	import flash.display3D.Context3DTextureFormat;
	import flash.display3D.IndexBuffer3D;
	import flash.display3D.Program3D;
	import flash.display3D.textures.Texture;
	import flash.display3D.VertexBuffer3D;
	import flash.utils.ByteArray;
	import z3d.context.Context3DContext;
	import z3d.scenegraph.Node;
	
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class TriMesh extends Node 
	{
		
		public static const BYTES_PER_FLOAT: int = 4;
		public static const BYTES_PER_SHORT: int = 2;
		public static const STRIDE: int = 5;
		
		protected var _texture: ByteArray;
		
		protected var _vertexString: String;
		protected var _fragmentString: String;
		protected var _vertexBuffer: ByteArray;
		protected var _indexBuffer: ByteArray;
		
		public var texture: Texture;
		public var program: Program3D;
		public var vertexBuffer: VertexBuffer3D;
		public var indexBuffer: IndexBuffer3D;
		
		protected var _context3D: Context3D;
		
		public function TriMesh() 
		{
			_context3D = Context3DContext.context;
		}
		
		protected function initResources(): void
		{
			createTexture();
			createProgram();
			createVertexBuffer();
			createIndexBuffer();
		}
		
		private function createTexture(): void
		{
			texture = _context3D.createTexture( 128, 128, Context3DTextureFormat.BGRA, false );
			texture.uploadCompressedTextureFromByteArray( _texture, 0, false );
		}
		
		private function createProgram(): void
		{
			var vertexAssembler: AGALMiniAssembler = new AGALMiniAssembler();
			vertexAssembler.assemble( Context3DProgramType.VERTEX, _vertexString, false );
			
			var fragmentAssembler: AGALMiniAssembler = new AGALMiniAssembler();
			fragmentAssembler.assemble( Context3DProgramType.FRAGMENT, _fragmentString, false );
			
			program = _context3D.createProgram();
			program.upload( vertexAssembler.agalcode, fragmentAssembler.agalcode );
		}
		
		private function createVertexBuffer(): void
		{
			var numVertices: int = _vertexBuffer.length / BYTES_PER_FLOAT / STRIDE;
			vertexBuffer = _context3D.createVertexBuffer( numVertices, STRIDE );
			vertexBuffer.uploadFromByteArray( _vertexBuffer, 0, 0, numVertices );
		}
		
		private function createIndexBuffer(): void
		{
			var numIndices: int = _indexBuffer.length / BYTES_PER_SHORT;
			indexBuffer = _context3D.createIndexBuffer( numIndices );
			indexBuffer.uploadFromByteArray( _indexBuffer, 0, 0, numIndices );
		}
		
	}

}