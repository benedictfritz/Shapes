package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.World;

    import entities.*;

    public class TestWorld extends World {

        private var
            player:Player;

        public function TestWorld():void {
            super();
        }

        override public function begin():void {
            super.begin();
            player = new Player(FP.halfWidth, FP.halfHeight);
            player.line = new Line(new Vertex(300, 400), new Vertex(300, 100));
            add(player);
        }
    }
}