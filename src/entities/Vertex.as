package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;

    public class Vertex extends Entity {
        private var nextVertices:Array;

        public function Vertex(x:Number, y:Number):void {
            super(x, y);

            this.graphic = Image.createCircle(2);
        }

        override public function update():void {
            super.update();
        }
        
    }
}