package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.tweens.motion.LinearMotion;

    public class Line extends Entity {
        public static const SHAPE_NAME:String = Player.LINE;

        private var vertexOne:ShapeVertex;
        private var vertexTwo:ShapeVertex;

        public function Line(vertexOne:ShapeVertex, vertexTwo:ShapeVertex):void {
            super(0, 0);

            this.vertexOne = vertexOne;
            this.vertexTwo = vertexTwo;

            this.vertexOne.addSupportedShape(SHAPE_NAME, vertexTwo);
            this.vertexTwo.addSupportedShape(SHAPE_NAME, vertexOne);

            FP.world.add(this.vertexOne);
            FP.world.add(this.vertexTwo);
        }
    }
}