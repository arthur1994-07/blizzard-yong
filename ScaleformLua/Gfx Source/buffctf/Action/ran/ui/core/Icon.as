package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.net.*;
    import flash.system.*;
    import scaleform.gfx.*;

    public class Icon extends MovieClip
    {
        protected var _bitmap:Bitmap;
        protected var _imgPath:String;
        protected var mcMask:MovieClip;
        protected var posX:int;
        protected var posY:int;
        private static const ICON_WIDTH:int = 35;
        private static const ICON_HEIGHT:int = 35;

        public function Icon()
        {
            addEventListener(Event.REMOVED_FROM_STAGE, this.handleRemove, false, 0, true);
            InteractiveObjectEx.setHitTestDisable(this, true);
            this.mcMask = new MovieClip();
            this.mcMask.graphics.beginFill(16777215, 0);
            this.mcMask.graphics.drawRect(0, 0, ICON_WIDTH, ICON_HEIGHT);
            this.mcMask.graphics.endFill();
            this.mcMask.width = ICON_WIDTH;
            this.mcMask.height = ICON_HEIGHT;
            addChild(this.mcMask);
            return;
        }// end function

        public function handleRemove(event:Event) : void
        {
            ExternalInterface.call("OnImageRelease", this._imgPath);
            return;
        }// end function

        public function loadImage(param1:String, param2:int, param3:int) : void
        {
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
            this._imgPath = param1;
            this.posX = param2 * ICON_WIDTH * -1;
            this.posY = param3 * ICON_HEIGHT * -1;
            var _loc_4:* = new URLRequest(param1);
            var _loc_5:* = new LoaderContext(false, null);
            var _loc_6:* = new Loader();
            _loc_6.contentLoaderInfo.addEventListener(Event.COMPLETE, this.handleImageLoadComplete, false, 0, true);
            _loc_6.load(_loc_4, _loc_5);
            return;
        }// end function

        public function handleImageLoadComplete(event:Event) : void
        {
            var _loc_2:* = LoaderInfo(event.target);
            var _loc_3:* = _loc_2.loader;
            this.spriteImage(_loc_3.content as Bitmap);
            return;
        }// end function

        public function spriteImage(param1:Bitmap) : void
        {
            if (param1 == null)
            {
                return;
            }
            this._bitmap = new Bitmap(param1.bitmapData);
            this._bitmap.pixelSnapping = PixelSnapping.NEVER;
            this._bitmap.smoothing = false;
            this._bitmap.mask = this.mcMask;
            this._bitmap.x = this.posX;
            this._bitmap.y = this.posY;
            addChild(this._bitmap);
            return;
        }// end function

        override public function toString() : String
        {
            return "[Icon " + name + "]";
        }// end function

    }
}
