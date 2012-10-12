package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.tweens.motion.Motion;
    import net.flashpunk.tweens.motion.LinearMotion;

    import entities.*;
    
    public class Player extends Entity {
        [Embed(source="../../assets/images/png/player_none.png")]
        private const NONE_IMG:Class;
        [Embed(source="../../assets/images/png/player_point.png")]
        private const POINT_IMG:Class;
        [Embed(source="../../assets/images/png/player_line.png")]
        private const LINE_IMG:Class;
        [Embed(source="../../assets/images/png/player_triangle.png")]
        private const TRIANGLE_IMG:Class;
        
        public static const NONE:String = "none";
        public static const POINT:String = "point";
        public static const LINE:String = "line";
        public static const TRIANGLE:String = "triangle";
        public var state:String;

        private static const MOVE_TIME:Number = 1.0;

        private var noneImage:Image = new Image(NONE_IMG);
        private var pointImage:Image = new Image(POINT_IMG);
        private var lineImage:Image = new Image(LINE_IMG);
        private var triangleImage:Image = new Image(TRIANGLE_IMG);

        public var currentMotion:LinearMotion;
        public var currentVertex:ShapeVertex;
        public var nextVertex:ShapeVertex;

        public function Player(startVertex:ShapeVertex):void {
            super(startVertex.x, startVertex.y);

            currentVertex = startVertex;

            noneImage.centerOrigin();
            pointImage.centerOrigin();
            triangleImage.centerOrigin();
            lineImage.centerOrigin();

            this.setHitbox(32, 32, 16, 16);
        }

        override public function update():void {
            super.update();

            if (!currentMotion) {
                var potentialNextVertex:ShapeVertex = currentVertex.nextVertexForShape(state);
                if (potentialNextVertex) {
                    nextVertex = potentialNextVertex;
                    currentMotion = new LinearMotion(clearCurrentMotion);
                    currentMotion.setMotion(currentVertex.x, currentVertex.y, nextVertex.x, nextVertex.y, MOVE_TIME);
                    world.addTween(currentMotion);
                }
            }
            else {
                this.x = currentMotion.x;
                this.y = currentMotion.y;
            }

            checkInput();
            updateGraphic();
        }

        private function clearCurrentMotion():void {
            currentMotion = null;
            currentVertex = nextVertex;
        }

        private function checkInput():void {
            if (Input.check(Key.DIGIT_1)) { state = POINT; }
            else if (Input.check(Key.DIGIT_2)) { state = LINE; }
            else if (Input.check(Key.DIGIT_3)) { state = TRIANGLE; }
            else { state = NONE; }
        }

        private function updateGraphic():void {
            if (state == POINT) { this.graphic = pointImage; }
            else if (state == LINE) { this.graphic = lineImage; }
            else if (state == TRIANGLE) { this.graphic = triangleImage; }
            else { this.graphic = noneImage; }
        }
    }
}