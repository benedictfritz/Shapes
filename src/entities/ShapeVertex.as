package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;

    public class ShapeVertex extends Entity {
        // using an object as a dictionary cuz meh
        private var supportedShapes:Object;

        public function ShapeVertex(x:Number, y:Number):void {
            super(x, y);

            supportedShapes = new Object();
            this.graphic = Image.createCircle(2);
        }

        override public function update():void {
            super.update();
        }

        public function addSupportedShape(shapeName:String, nextVertex:ShapeVertex):void {
            supportedShapes[shapeName] = nextVertex;
        }

        public function nextVertexForShape(shapeName:String):ShapeVertex {
            return supportedShapes[shapeName];
        }
    }
}