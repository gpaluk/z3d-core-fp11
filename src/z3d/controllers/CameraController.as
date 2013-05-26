package z3d.controllers 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;
	import z3d.context.StageContext;
	import z3d.scenegraph.CameraNode;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class CameraController extends Controller 
	{
		
		public static const SPEED: Number = 0.005;
		public static const ROTATION_SPEED: Number = 0.05;
		
		protected var _stage: Stage;
		
		private var _wPressed: Boolean;
		private var _aPressed: Boolean;
		private var _sPressed: Boolean;
		private var _dPressed: Boolean;
		
		private var _leftPressed: Boolean;
		private var _rightPressed: Boolean;
		private var _upPressed: Boolean;
		private var _downPressed: Boolean;
		
		public function CameraController( ) 
		{
			_stage = StageContext.context;
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			_stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		protected function onKeyDown( e: KeyboardEvent ): void
		{
			e.keyCode == Keyboard.W ? _wPressed = true : null;
			e.keyCode == Keyboard.A ? _aPressed = true : null;
			e.keyCode == Keyboard.S ? _sPressed = true : null;
			e.keyCode == Keyboard.D ? _dPressed = true : null;
			
			e.keyCode == Keyboard.LEFT ? _leftPressed = true : null;
			e.keyCode == Keyboard.RIGHT ? _rightPressed = true : null;
			e.keyCode == Keyboard.UP ? _upPressed = true : null;
			e.keyCode == Keyboard.DOWN ? _downPressed = true : null;
		}
		
		protected function onKeyUp( e: KeyboardEvent ): void
		{
			e.keyCode == Keyboard.W ? _wPressed = false : null;
			e.keyCode == Keyboard.A ? _aPressed = false : null;
			e.keyCode == Keyboard.S ? _sPressed = false : null;
			e.keyCode == Keyboard.D ? _dPressed = false : null;
			
			e.keyCode == Keyboard.LEFT ? _leftPressed = false : null;
			e.keyCode == Keyboard.RIGHT ? _rightPressed = false : null;
			e.keyCode == Keyboard.UP ? _upPressed = false : null;
			e.keyCode == Keyboard.DOWN ? _downPressed = false : null;
		}
		
		override public function update(dt:Number):void 
		{
			_wPressed ? cameraNode.camera.view.appendTranslation( 0, 0, -(SPEED * dt) ) : null;
			_aPressed ? cameraNode.camera.view.appendTranslation( SPEED * dt, 0, 0 ) : null;
			_sPressed ? cameraNode.camera.view.appendTranslation( 0, 0, SPEED * dt ) : null;
			_dPressed ? cameraNode.camera.view.appendTranslation( -(SPEED * dt), 0, 0 ) : null;
			
			_leftPressed ? cameraNode.camera.view.appendRotation( ROTATION_SPEED * dt, new Vector3D(0, 1, 0 ) ) : null;
			_rightPressed ? cameraNode.camera.view..appendRotation( -(ROTATION_SPEED * dt), new Vector3D(0, 1, 0 ) ) : null;
			_upPressed ? cameraNode.camera.view.appendRotation( ROTATION_SPEED * dt, new Vector3D(1, 0, 0 ) ) : null;
			_downPressed ? cameraNode.camera.view..appendRotation( -(ROTATION_SPEED * dt), new Vector3D(1, 0, 0 ) ) : null;
		}
		
		public function get cameraNode(): CameraNode
		{
			return this.controlledObject as CameraNode;
		}
		
	}

}