package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;

    public class MMaskedView extends UIComponent
    {
        public var mcItemRenderer:MovieClip;
        protected var scrollBarClass:Class;
        protected var scrollBar:MScrollBar;
        protected var _scrollBarName:String = "";
        protected var _realWidth:int = 0;
        protected var _realHeight:int = 0;
        public var scrollSpeed:int = 1;
        public var maskWidth:int = -1;
        public var maskHeight:int = -1;

        public function MMaskedView()
        {
            return;
        }// end function

        public function get scrollBarName() : String
        {
            return this._scrollBarName;
        }// end function

        public function set scrollBarName(param1:String) : void
        {
            this._scrollBarName = param1;
            if (this._scrollBarName == "")
            {
                return;
            }
            var _loc_2:* = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null)
            {
                _loc_2 = loaderInfo.applicationDomain;
            }
            this.scrollBarClass = _loc_2.getDefinition(this._scrollBarName) as Class;
            return;
        }// end function

        public function get realWidth() : int
        {
            return this._realWidth;
        }// end function

        public function set realWidth(param1:int) : void
        {
            if (this._realWidth == param1)
            {
                return;
            }
            this._realWidth = param1;
            invalidateSize();
            return;
        }// end function

        public function get realHeight() : int
        {
            return this._realHeight;
        }// end function

        public function set realHeight(param1:int) : void
        {
            if (this._realHeight == param1)
            {
                return;
            }
            this._realHeight = param1;
            invalidateSize();
            return;
        }// end function

        override public function get width() : Number
        {
            return this._realWidth == 0 ? (super.width) : (this._realWidth);
        }// end function

        override public function set width(param1:Number) : void
        {
            this.realWidth = param1;
            return;
        }// end function

        override public function get height() : Number
        {
            return this._realHeight == 0 ? (super.height) : (this._realHeight);
        }// end function

        override public function set height(param1:Number) : void
        {
            this.realHeight = param1;
            return;
        }// end function

        override protected function configUI() : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (this.maskWidth != -1 && this.maskHeight != -1)
            {
                this._realWidth = this.maskWidth;
                this._realHeight = this.maskHeight;
            }
            else
            {
                this._realWidth = this.width / this.scaleX;
                this._realHeight = this.height / this.scaleY;
            }
            var _loc_1:* = new MovieClip();
            _loc_1.graphics.beginFill(16777215);
            _loc_1.graphics.drawRect(0, 0, this._realWidth, this._realHeight);
            _loc_1.graphics.endFill();
            addChild(_loc_1);
            mask = _loc_1;
            if (this.mcItemRenderer == null)
            {
                this.mcItemRenderer = new MovieClip();
                addChild(this.mcItemRenderer);
            }
            else
            {
                _loc_2 = 0;
                while (_loc_2 < this.mcItemRenderer.numChildren)
                {
                    
                    _loc_3 = this.mcItemRenderer.getChildAt(_loc_2) as UIComponent;
                    if (_loc_3 != null)
                    {
                    }
                    else
                    {
                        _loc_4 = this.mcItemRenderer.getChildAt(_loc_2) as InteractiveObject;
                        if (_loc_4)
                        {
                            _loc_4.mouseEnabled = false;
                        }
                    }
                    _loc_2++;
                }
            }
            if (this.scrollBarClass != null)
            {
                this.scrollBar = new this.scrollBarClass() as MScrollBar;
                if (this.scrollBar != null)
                {
                    this.scrollBar.name = "scrollBar";
                    this.scrollBar.width = this.scrollBar.width / this.scaleX;
                    this.scrollBar.height = this._realHeight;
                    this.scrollBar.x = this._realWidth - this.scrollBar.width;
                    this.scrollBar.y = 0;
                    this.scrollBar.target = this.mcItemRenderer;
                    this.scrollBar.scrollSpeed = this.scrollSpeed;
                    addChild(this.scrollBar);
                    this.scrollBar.updateThumb();
                    this.scrollBar.resetThumb();
                }
            }
            addEventListener(MouseEvent.MOUSE_WHEEL, this.onScroll, false, 0, true);
            return;
        }// end function

        protected function onScroll(event:MouseEvent) : void
        {
            if (this.mcItemRenderer.height <= this.realHeight)
            {
                return;
            }
            var _loc_2:* = event.delta * this.scrollSpeed;
            var _loc_3:* = this.mcItemRenderer.y + _loc_2;
            if (_loc_2 > 0 && _loc_3 > 0)
            {
                _loc_3 = 0;
            }
            else if (_loc_2 < 0 && this.realHeight > _loc_3 + this.mcItemRenderer.height)
            {
                _loc_3 = this.mcItemRenderer.height * -1 + this.realHeight;
            }
            this.mcItemRenderer.y = _loc_3;
            if (this.scrollBar != null)
            {
                this.scrollBar.syncScroll();
            }
            dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_EVENT, true, false, event.delta));
            return;
        }// end function

    }
}
