package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;
    import net.flashpunk.graphics.Image;
    
    public class Player extends Entity {
        [Embed(source="../../assets/images/png/player_point.png")]
        private const POINT:Class;
        [Embed(source="../../assets/images/png/player_triangle.png")]
        private const TRIANGLE:Class;
        
        public var line:Line;

        public var state:String;

        private var pointImage:Image = new Image(POINT);
        private var triangleImage:Image = new Image(TRIANGLE);

        public function Player(x:Number, y:Number):void {
            super(x, y);
            pointImage.centerOrigin();
            triangleImage.centerOrigin();
        }

        override public function update():void {
            super.update();

            if (Input.check(Key.DIGIT_1)) {
                this.graphic = pointImage;
            }
            else if (Input.check(Key.DIGIT_3)) {
                this.graphic = triangleImage
            }
            else {
                this.graphic = null;
            }

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