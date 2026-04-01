package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import scaleform.gfx.*;

    public class Icon extends MovieClip
    {
        protected var imgLoader:Loader;
        protected var _bitmap:Bitmap;
        protected var _imgPath:String;
        public var isLoading:Boolean = false;
        private static const ICON_WIDTH:int = 35;
        private static const ICON_HEIGHT:int = 35;
        private static var imgContainer:Dictionary;

        public function Icon()
        {
            addEventListener(Event.REMOVED_FROM_STAGE, this.handleRemove, false, 0, true);
            InteractiveObjectEx.setHitTestDisable(this, true);
            if (imgContainer == null)
            {
                imgContainer = new Dictionary();
            }
            return;
        }// end function

        public function handleRemove(event:Event) : void
        {
            if (this._imgPath != null || this._imgPath == "")
            {
                ExternalInterface.call("OnImageRelease", this._imgPath);
            }
            return;
        }// end function

        public function loadImage(param1:String) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            if (this._bitmap != null)
            {
                removeChild(this._bitmap);
                this._bitmap = null;
                this.handleRemove(null);
            }
            if (!param1 || param1 == "")
            {
                return;
            }
            this.handleRemove(null);
            this._imgPath = param1;
            if (imgContainer[this._imgPath] != null)
            {
                this.CopyBitmapData(imgContainer[this._imgPath]);
            }
            else
            {
                _loc_2 = new URLRequest(param1);
                _loc_3 = new LoaderContext(false, null);
                this.imgLoader = new Loader();
                this.imgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.handleImageLoadComplete, false, 0, true);
                this.imgLoader.load(_loc_2, _loc_3);
                this.isLoading = true;
            }
            return;
        }// end function

        public function handleImageLoadComplete(event:Event) : void
        {
            var _loc_2:* = this.imgLoader.content as Bitmap;
            if (_loc_2 == null)
            {
                return;
            }
            imgContainer[this._imgPath] = _loc_2.bitmapData;
            this.CopyBitmapData(imgContainer[this._imgPath]);
            this.isLoading = false;
            return;
        }// end function

        public function CopyBitmapData(param1:BitmapData) : void
        {
            this._bitmap = new Bitmap(param1);
            this._bitmap.pixelSnapping = PixelSnapping.NEVER;
            this._bitmap.smoothing = false;
            addChild(this._bitmap);
            return;
        }// end function

        override public function toString() : String
        {
            return "[Icon " + name + "]";
        }// end function

    }
}
