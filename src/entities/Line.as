package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.tweens.motion.LinearMotion;

    public class Line extends Entity {
        private var vertexOne:Vertex;
        private var vertexTwo:Vertex;

        public var linearMotion:LinearMotion;

        public function Line(vertexOne:Vertex, vertexTwo:Vertex):void {
            super(0, 0);

            this.vertexOne = vertexOne;
            this.vertexTwo = vertexTwo;

            FP.world.add(this.vertexOne);
            FP.world.add(this.vertexTwo);
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