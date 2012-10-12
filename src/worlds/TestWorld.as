package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.World;

    import entities.*;

    public class TestWorld extends World {

        private var
            player:Player,
            line:Line,
            triangle:Triangle;

        public function TestWorld():void {
            super();
        }

        override public function begin():void {
            super.begin();
            
            var vertexOne:ShapeVertex = new ShapeVertex(156, 300);
            var vertexTwo:ShapeVertex = new ShapeVertex(256, 100);
            var vertexThree:ShapeVertex = new ShapeVertex(356, 300);
            var vertexFour:ShapeVertex = new ShapeVertex(156, 100);

            add(new Triangle(vertexOne, vertexTwo, vertexThree));
            add(new Line(vertexOne, vertexFour));
            player = new Player(vertexOne);
            add(player);
        }
    }
}