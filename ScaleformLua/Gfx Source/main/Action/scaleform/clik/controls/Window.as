package scaleform.clik.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.system.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;
    import scaleform.clik.utils.*;

    public class Window extends UIComponent
    {
        public var minWidth:Number = 150;
        public var maxWidth:Number = 500;
        public var minHeight:Number = 150;
        public var maxHeight:Number = 500;
        protected var _title:String;
        protected var _src:String = "";
        protected var _contentPadding:Padding;
        protected var _content:DisplayObject;
        protected var _dragProps:Array;
        public var closeBtn:Button;
        public var okBtn:Button;
        public var resizeBtn:Button;
        public var titleBtn:Button;
        public var background:MovieClip;
        public var hit:MovieClip;
        public var mcFocus:MovieClip;
        public var customDrag:Boolean = false;

        public function Window()
        {
            this._contentPadding = new Padding(0, 0, 0, 0);
            hitArea = this.hit;
            return;
        }// end function

        public function set customWidth(param1:int) : void
        {
            var _loc_2:* = this.background.width - this.closeBtn.x;
            this.closeBtn.x = param1 - _loc_2;
            var _loc_3:* = this.titleBtn.width / this.background.width;
            this.titleBtn.width = _loc_3 * param1;
            this.background.width = param1;
            this.hit.width = param1;
            this.mcFocus.width = param1;
            this.width = param1;
            return;
        }// end function

        public function get customWidth() : int
        {
            return this.width;
        }// end function

        public function set customHeight(param1:int) : void
        {
            this.background.height = param1;
            this.hit.height = param1;
            this.mcFocus.height = param1;
            this.height = param1;
            return;
        }// end function

        public function get customHeight() : int
        {
            return this.height;
        }// end function

        public function get title() : String
        {
            return this._title;
        }// end function

        public function set title(param1:String) : void
        {
            this._title = param1;
            if (this.titleBtn != null && this.titleBtn.initialized)
            {
                this.titleBtn.label = this._title;
            }
            return;
        }// end function

        public function get source() : String
        {
            return this._src;
        }// end function

        public function set source(param1:String) : void
        {
            this._src = param1;
            invalidate("source");
            return;
        }// end function

        public function get contentPadding() : Object
        {
            return this._contentPadding;
        }// end function

        public function set contentPadding(param1:Object) : void
        {
            this._contentPadding = new Padding(param1.top, param1.right, param1.bottom, param1.left);
            invalidate("padding");
            return;
        }// end function

        override protected function preInitialize() : void
        {
            constraints = new Constraints(this, ConstrainMode.REFLOW);
            return;
        }// end function

        override protected function initialize() : void
        {
            tabEnabled = false;
            var _loc_1:* = enabled;
            mouseChildren = enabled;
            mouseEnabled = _loc_1;
            super.initialize();
            return;
        }// end function

        override protected function configUI() : void
        {
            initSize();
            if (hitArea != null)
            {
                constraints.addElement("hitArea", hitArea, Constraints.ALL);
            }
            if (this.background != null)
            {
                constraints.addElement("background", this.background, Constraints.ALL);
            }
            if (this.mcFocus != null)
            {
                constraints.addElement("focus", this.mcFocus, Constraints.ALL);
            }
            if (this.titleBtn != null)
            {
                this.titleBtn.label = this._title || "My Window";
                this.titleBtn.addEventListener(MouseEvent.MOUSE_DOWN, this.onWindowStartDrag, false, 0, true);
                constraints.addElement("titleBtn", this.titleBtn, Constraints.TOP | Constraints.LEFT | Constraints.RIGHT);
            }
            if (this.closeBtn != null)
            {
                this.closeBtn.addEventListener(MouseEvent.CLICK, this.onCloseButtonClick, false, 0, true);
                constraints.addElement("closeBtn", this.closeBtn, Constraints.TOP | Constraints.RIGHT);
            }
            if (this.resizeBtn != null)
            {
                constraints.addElement("resizeBtn", this.resizeBtn, Constraints.BOTTOM | Constraints.RIGHT);
            }
            if (this.okBtn != null)
            {
                constraints.addElement("okBtn", this.okBtn, Constraints.BOTTOM | Constraints.RIGHT);
                this.okBtn.addEventListener(MouseEvent.CLICK, this.onCloseButtonClick, false, 0, true);
            }
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid("source"))
            {
                this.loadSource();
                this.reflowContent();
            }
            else if (isInvalid("padding"))
            {
                this.reflowContent();
            }
            if (isInvalid(InvalidationType.SIZE))
            {
                constraints.update(_width, _height);
            }
            return;
        }// end function

        protected function loadSource() : void
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            if (this._src != "")
            {
                if (this._content)
                {
                    constraints.removeElement("content");
                    removeChild(this._content);
                }
                _loc_1 = ApplicationDomain.currentDomain;
                if (loaderInfo != null && loaderInfo.applicationDomain != null)
                {
                    _loc_1 = loaderInfo.applicationDomain;
                }
                _loc_2 = _loc_1.getDefinition(this._src) as Class;
                if (_loc_2)
                {
                    this._content = new _loc_2;
                }
                else
                {
                    this._content = null;
                    trace("Error: Cannot load content for " + name + "; symbol " + this._src + " not found!");
                    return;
                }
                addChild(this._content);
                constraints.addElement("content", this._content, Constraints.ALL);
                this._content.name = "content";
            }
            return;
        }// end function

        protected function reflowContent() : void
        {
            if (!this._content)
            {
                return;
            }
            var _loc_1:* = this._contentPadding;
            var _loc_2:* = constraints.getElement("content");
            var _loc_3:* = _loc_1.left;
            _loc_2.left = _loc_1.left;
            this._content.x = _loc_3;
            var _loc_3:* = _loc_1.top;
            _loc_2.top = _loc_1.top;
            this._content.y = _loc_3;
            _loc_2.right = _loc_1.right;
            _loc_2.bottom = _loc_1.bottom;
            this._content.width = _width - _loc_1.horizontal;
            this._content.height = _height - _loc_1.vertical;
            invalidateSize();
            return;
        }// end function

        protected function onWindowStartDrag(event:MouseEvent) : void
        {
            var _loc_2:* = null;
            if (this.customDrag == false)
            {
                stage.addEventListener(MouseEvent.MOUSE_UP, this.onWindowStopDrag, false, 0, true);
                _loc_2 = new Rectangle(0, 0, stage.stageWidth - width, stage.stageHeight - height);
                startDrag(false, _loc_2);
            }
            return;
        }// end function

        protected function onWindowStopDrag(event:MouseEvent) : void
        {
            if (this.customDrag == false)
            {
                stage.removeEventListener(MouseEvent.MOUSE_UP, this.onWindowStopDrag, false);
                stopDrag();
            }
            return;
        }// end function

        protected function onResizeStartDrag(event:Event) : void
        {
            stage.addEventListener(MouseEvent.MOUSE_UP, this.onResizeStopDrag, false, 0, true);
            this._dragProps = [parent.mouseX - (x + width), parent.mouseY - (y + height)];
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.onResizeMouseMove, false, 0, true);
            return;
        }// end function

        protected function onResizeStopDrag(event:Event) : void
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.onResizeMouseMove, false);
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.onResizeStopDrag, false);
            return;
        }// end function

        protected function onResizeMouseMove(event:Event) : void
        {
            var _loc_2:* = Math.max(this._content.width + this._contentPadding.left, Math.min(this.maxWidth, parent.mouseX - x));
            var _loc_3:* = Math.max(this._content.height + this._contentPadding.top, Math.min(this.maxHeight, parent.mouseY - y));
            if (_loc_2 != _width || _loc_3 != _height)
            {
                setSize(_loc_2, _loc_3);
                dispatchEventAndSound(new ResizeEvent(ResizeEvent.RESIZE, scaleX, scaleY));
            }
            return;
        }// end function

        protected function onCloseButtonClick(event:MouseEvent) : void
        {
            parent.removeChild(this);
            dispatchEventAndSound(new ComponentEvent(ComponentEvent.HIDE));
            return;
        }// end function

    }
}
