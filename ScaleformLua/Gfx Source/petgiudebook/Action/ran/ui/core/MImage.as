package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.system.*;
    import scaleform.clik.core.*;

    public class MImage extends UIComponent
    {
        protected var _rect:Rectangle;
        protected var _bitmap:Bitmap;
        protected var _imgPath:String;
        protected var _imgX:Number;
        protected var _imgY:Number;
        protected var _imgW:Number;
        protected var _imgH:Number;

        public function MImage()
        {
            addEventListener(Event.REMOVED_FROM_STAGE, this.handleRemove, false, 0, true);
            return;
        }// end function

        public function handleRemove(event:Event) : void
        {
            ExternalInterface.call("OnImageRelease", this._imgPath);
            return;
        }// end function

        public function LoadImage(param1:String, param2:Number, param3:Number, param4:Number, param5:Number) : void
        {
            if (!param1 || param1 == "")
            {
                return;
            }
            this._imgPath = param1;
            this._imgX = param2;
            this._imgY = param3;
            this._imgW = param4;
            this._imgH = param5;
            this._rect = new Rectangle(param2, param3, param4, param5);
            var _loc_6:* = new URLRequest(param1);
            var _loc_7:* = new LoaderContext(false, null);
            var _loc_8:* = new Loader();
            _loc_8.contentLoaderInfo.addEventListener(Event.COMPLETE, this.handleImageLoadComplete, false, 0, true);
            _loc_8.load(_loc_6, _loc_7);
            return;
        }// end function

        public function RemoveImage() : void
        {
            if (this._bitmap != null)
            {
                removeChild(this._bitmap);
                this._bitmap = null;
            }
            return;
        }// end function

        private function handleImageLoadComplete(event:Event) : void
        {
            var _loc_2:* = LoaderInfo(event.target);
            var _loc_3:* = _loc_2.loader;
            var _loc_4:* = _loc_3.content as Bitmap;
            var _loc_5:* = new BitmapData(this._imgW, this._imgH);
            _loc_5.copyPixels(_loc_4.bitmapData, this._rect, new Point(0, 0));
            if (this._bitmap != null)
            {
                removeChild(this._bitmap);
                this._bitmap = null;
                ExternalInterface.call("OnImageRelease", this._imgPath);
            }
            this._bitmap = new Bitmap(_loc_5);
            this._bitmap.width = width;
            this._bitmap.height = height;
            addChild(this._bitmap);
            return;
        }// end function

    }
}
