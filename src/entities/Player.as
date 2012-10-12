package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;
    import net.flashpunk.graphics.Image;
    
    public class Player extends Entity {
        [Embed(source="../../assets/images/png/player_triangle.png")]
        private const PLAYER:Class;

        public var line:Line;

        public function Player(x:Number, y:Number):void {
            super(x, y);
            var playerImage:Image = new Image(PLAYER);
            playerImage.centerOrigin();
            this.graphic = playerImage;
        }

        override public function update():void {
            super.update();

            if (!line.linearMotion) {
                line.startMotion();
            }
            else {
                this.x = line.linearMotion.x;
                this.y = line.linearMotion.y;
            }
        }
    }
}