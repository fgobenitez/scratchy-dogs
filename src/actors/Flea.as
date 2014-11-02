package actors
{
	import utils.math.Vector2D;
	import starling.textures.Texture;
	
	public class Flea extends Actor
	{
		public function Flea(textures:Vector.<Texture>, fps:Number=12)
		{
			super(textures, fps);
		}
		
		public function jump(v:Vector2D):void{
		
		}
	}
}