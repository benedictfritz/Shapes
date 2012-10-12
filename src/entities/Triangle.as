package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.tweens.motion.LinearMotion;

    import entities.*;

    public class Triangle extends Entity {
        public static const SHAPE_NAME:String = Player.TRIANGLE;

        private var vertexOne:ShapeVertex;
        private var vertexTwo:ShapeVertex;
        private var vertexThree:ShapeVertex;

        public var linearMotion:LinearMotion;

        public function Triangle(vertexOne:ShapeVertex, vertexTwo:ShapeVertex, vertexThree:ShapeVertex):void {
            super(0, 0);

            this.vertexOne = vertexOne;
            this.vertexTwo = vertexTwo;
            this.vertexThree = vertexThree;

            this.vertexOne.addSupportedShape(SHAPE_NAME, vertexTwo);
            this.vertexTwo.addSupportedShape(SHAPE_NAME, vertexThree);
            this.vertexThree.addSupportedShape(SHAPE_NAME, vertexOne);
            
            FP.world.add(this.vertexOne);
            FP.world.add(this.vertexTwo);
            FP.world.add(this.vertexThree);
        }

        public function startMotion():void {
            goForward();
        }

        private function goForward():void {
            this.linearMotion = new LinearMotion(goBackward);
            this.linearMotion.setMotion(this.vertexOne.x, this.vertexOne.y, this.vertexTwo.x, this.vertexTwo.y, 5);
            FP.world.addTween(this.linearMotion);
        }

        public function goBackward():void {
            this.linearMotion = new LinearMotion(goForward);
            this.linearMotion.setMotion(this.vertexTwo.x, this.vertexTwo.y, this.vertexOne.x, this.vertexOne.y, 5);
            FP.world.addTween(this.linearMotion);
        }

    }
}