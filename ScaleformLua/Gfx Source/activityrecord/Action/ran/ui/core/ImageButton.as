package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import scaleform.clik.core.*;

    public class ImageButton extends UIComponent
    {
        private var loader:Loader;
        private var background:MovieClip;
        private var border:MovieClip;
        public var layers:MovieClip;
        public var image:MovieClip;
        private var strImgFile:String;

        public function ImageButton()
        {
            return;
        }// end function

        public function CheckDebug()
        {
            trace("DebugCheck");
            return;
        }// end function

        public function RemoveImage()
        {
            if (this.image == null || this.loader == null)
            {
                return;
            }
            this.image.removeChild(this.loader);
            return;
        }// end function

        public function LoadImage(param1:String) : void
        {
            if (this.loader != null)
            {
                this.image.removeChild(this.loader);
            }
            this.strImgFile = param1;
            trace(param1);
            this.loader = new Loader();
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadComplete, false, 0, true);
            this.loader.load(new URLRequest(param1));
            this.image.addChild(this.loader);
            return;
        }// end function

        private function onLoadComplete(event:Event) : void
        {
            this.image.scaleX = 1;
            this.image.scaleY = 1;
            this.image.x = -512;
            this.image.y = -300;
            return;
        }// end function

    }
}
