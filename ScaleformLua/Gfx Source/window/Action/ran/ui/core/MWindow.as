package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.net.*;
    import flash.system.*;
    import ran.ui.*;
    import ran.ui.events.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.events.*;
    import scaleform.clik.motion.*;
    import scaleform.clik.utils.*;

    public class MWindow extends Window
    {
        protected var _loader:Loader;
        protected var arrLoadCompleteProc:Array;
        protected var _stateMap:Object;
        protected var _state:String = "";
        public var widgetID:int = -1;
        public var subID:int = 0;
        public var stageRef:Stage;
        private var _isOpen:Boolean = false;
        private var isRollOver:Boolean = false;
        private var isFocus:Boolean = false;
        public var isDeleted:Boolean = false;
        public var isPreload:Boolean = false;
        public var coreInterface:IUICoreInterface;

        public function MWindow()
        {
            this.arrLoadCompleteProc = [];
            this._stateMap = {nonfocus:["non focus"], over:["over"], focus:["focus"]};
            closeBtn.visible = true;
            contentPadding = new Padding(24, 251, 251, 5);
            this.__setProp_titleBtn_Scene1_titleBtn_0();
            this.__setProp_closeBtn_Scene1_closeBtn_0();
            return;
        }// end function

        public function get isOpen() : Boolean
        {
            return this._isOpen;
        }// end function

        public function get content() : DisplayObject
        {
            return _content;
        }// end function

        override protected function configUI() : void
        {
            initSize();
            constraints.addElement("focus", mcFocus, Constraints.ALL);
            constraints.addElement("hitArea", hitArea, Constraints.ALL);
            constraints.addElement("background", background, Constraints.ALL);
            constraints.addElement("titleBtn", titleBtn, Constraints.TOP | Constraints.LEFT | Constraints.RIGHT);
            constraints.addElement("closeBtn", closeBtn, Constraints.TOP | Constraints.RIGHT);
            addEventListener(Event.REMOVED_FROM_STAGE, this.handleRemovedFromStage, false, 0, true);
            addEventListener(MouseEvent.MOUSE_DOWN, this.onWindowSwapToFront, false, 0, true);
            addEventListener(MouseEvent.ROLL_OVER, this.onRollOver, false, 0, true);
            addEventListener(MouseEvent.ROLL_OUT, this.onRollOut, false, 0, true);
            addEventListener(FocusEvent.FOCUS_IN, this.onFocusIn, false, 0, true);
            addEventListener(FocusEvent.FOCUS_OUT, this.onFocusOut, false, 0, true);
            closeBtn.addEventListener(ButtonEvent.CLICK, this.handleCloseButtonClick, false, 0, true);
            closeBtn.addEventListener(MouseEvent.ROLL_OUT, this.onBtnDisableState, false, 0, true);
            closeBtn.fakeOver = true;
            titleBtn.addEventListener(MouseEvent.MOUSE_DOWN, this.onWindowStartDrag, false, 0, true);
            titleBtn.addEventListener(MouseEvent.ROLL_OVER, this.onBtnDisableState, false, 0, true);
            titleBtn.addEventListener(MouseEvent.ROLL_OUT, this.onBtnDisableState, false, 0, true);
            titleBtn.fakeDisable = true;
            constraints.update(width, height);
            invalidateSize();
            return;
        }// end function

        override protected function addedToStage(event:Event) : void
        {
            super.addedToStage(event);
            if (this.coreInterface != null && this.coreInterface.focusWindow != null)
            {
                this.coreInterface.focusWindow.NonFocusWindow();
            }
            this.FocusWindow();
            return;
        }// end function

        protected function onBtnDisableState(event:MouseEvent) : void
        {
            if (this.coreInterface == null)
            {
                return;
            }
            if (this.coreInterface.focusWindow == this)
            {
                return;
            }
            var _loc_2:* = event.target as Button;
            _loc_2.setState("disabled");
            return;
        }// end function

        protected function onFocusIn(event:FocusEvent) : void
        {
            if (this.coreInterface.focusWindow == this)
            {
                return;
            }
            if (this.coreInterface.focusWindow != null)
            {
                this.coreInterface.focusWindow.NonFocusWindow();
            }
            this.FocusWindow();
            return;
        }// end function

        protected function onFocusOut(event:FocusEvent) : void
        {
            return;
        }// end function

        protected function onRollOver(event:MouseEvent) : void
        {
            if (this.coreInterface == null)
            {
                return;
            }
            if (this.coreInterface.focusWindow == this)
            {
                return;
            }
            this._state = "over";
            mcFocus.gotoAndPlay(this._state);
            titleBtn.enabled = true;
            closeBtn.enabled = true;
            titleBtn.setState("disabled");
            closeBtn.setState("disabled");
            return;
        }// end function

        protected function onRollOut(event:MouseEvent) : void
        {
            if (this.coreInterface == null)
            {
                return;
            }
            if (this.coreInterface.focusWindow == this)
            {
                return;
            }
            this._state = "non focus";
            mcFocus.gotoAndPlay(this._state);
            titleBtn.enabled = false;
            closeBtn.enabled = false;
            return;
        }// end function

        public function FocusWindow() : void
        {
            if (this.coreInterface == null)
            {
                return;
            }
            if (this.coreInterface.focusWindow != null && this.coreInterface.focusWindow != this)
            {
                this.coreInterface.focusWindow.NonFocusWindow();
            }
            this._state = "focus";
            mcFocus.gotoAndPlay(this._state);
            titleBtn.enabled = true;
            closeBtn.enabled = true;
            this.coreInterface.focusWindow = this;
            return;
        }// end function

        public function NonFocusWindow() : void
        {
            this._state = "non focus";
            mcFocus.gotoAndPlay(this._state);
            titleBtn.enabled = false;
            closeBtn.enabled = false;
            return;
        }// end function

        override protected function loadSource() : void
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            if (_src != "")
            {
                if (_content)
                {
                    constraints.removeElement("content");
                    removeChild(_content);
                }
                this._loader = new Loader();
                _loc_1 = new URLRequest(_src);
                _loc_2 = new LoaderContext(false, null);
                this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.handleContentLoadComplete, false, 0, true);
                this._loader.load(_loc_1, _loc_2);
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
            }
            return;
        }// end function

        override protected function reflowContent() : void
        {
            if (!_content)
            {
                return;
            }
            _content.x = this.contentPadding.left;
            _content.y = this.contentPadding.top;
            var _loc_1:* = width - contentPadding.right;
            var _loc_2:* = height - contentPadding.bottom;
            var _loc_3:* = _content.width + _content.x + _loc_1 + 1;
            var _loc_4:* = _content.height + _content.y + _loc_2 + 1;
            constraints.update(_loc_3, _loc_4);
            invalidateSize();
            return;
        }// end function

        protected function CopyArray(param1:Array) : Array
        {
            var _loc_2:* = [];
            var _loc_3:* = 0;
            while (_loc_3 < param1.length)
            {
                
                _loc_2.push(param1[_loc_3]);
                _loc_3++;
            }
            return _loc_2;
        }// end function

        public function RemoveContent() : void
        {
            if (_content)
            {
                removeChild(_content);
                _content.removeEventListener(SimpleTooltipEvent.OPEN, this.onOpenTooltip);
                _content.removeEventListener(SimpleTooltipEvent.CLOSE, this.onCloseTooltip);
                _content = null;
            }
            if (this._loader)
            {
                this._loader.unloadAndStop(true);
            }
            return;
        }// end function

        protected function handleContentLoadComplete(event:Event) : void
        {
            titleBtn.label = _title;
            var _loc_2:* = event.target.loader as Loader;
            _content = _loc_2.content;
            addChild(_content);
            this.reflowContent();
            this.coreInterface.LoadCompleteProc(this, this.widgetID, this.subID, this.isPreload);
            if (this.isPreload == true)
            {
                this.isPreload = false;
            }
            else
            {
                _content.addEventListener(SimpleTooltipEvent.OPEN, this.onOpenTooltip, false, 0, true);
                _content.addEventListener(SimpleTooltipEvent.CLOSE, this.onCloseTooltip, false, 0, true);
                this._isOpen = true;
            }
            return;
        }// end function

        public function onWindowSwapToFront(event:MouseEvent = null) : void
        {
            var _loc_2:* = this.parent as Sprite;
            if (_loc_2 == null)
            {
                trace("MWindow::onWindowSwapToFront - parent null");
                return;
            }
            _loc_2.setChildIndex(this, (_loc_2.numChildren - 1));
            if (this.coreInterface.focusWindow != this)
            {
                if (this.coreInterface.focusWindow != null)
                {
                    this.coreInterface.focusWindow.NonFocusWindow();
                }
                this.FocusWindow();
            }
            this.coreInterface.SwapESCList(this);
            return;
        }// end function

        protected function handleCloseButtonClick(event:ButtonEvent) : void
        {
            this.coreInterface.WindowCloseESC(this.widgetID, this);
            dispatchEvent(new WidgetEvent(WidgetEvent.CLOSE_WIDGET, true, false, this.widgetID, this.subID));
            return;
        }// end function

        protected function handleRemovedFromStage(event:Event) : void
        {
            if (this.isDeleted == false)
            {
                return;
            }
            this.RemoveContent();
            return;
        }// end function

        protected function onOpenTooltip(event:SimpleTooltipEvent) : void
        {
            this.coreInterface.OpenTooltip(event);
            return;
        }// end function

        protected function onCloseTooltip(event:SimpleTooltipEvent) : void
        {
            this.coreInterface.CloseTooltip(event);
            return;
        }// end function

        private function OnTweenComplete(param1:Tween) : void
        {
            if (param1.data.event != null && undefined != param1.data.event)
            {
                ExternalInterface.call("OnCustomEvent", param1.data.event);
            }
            return;
        }// end function

        override protected function onWindowStartDrag(event:MouseEvent) : void
        {
            if (customDrag == true)
            {
                return;
            }
            _dragProps = [event.stageX, event.stageY, this.x, this.y];
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.onWindowDragging, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_UP, this.onWindowStopDrag, false, 0, true);
            return;
        }// end function

        protected function onWindowDragging(event:MouseEvent) : void
        {
            var _loc_2:* = event.stageX - _dragProps[0];
            var _loc_3:* = event.stageY - _dragProps[1];
            var _loc_4:* = _dragProps[2] + _loc_2;
            var _loc_5:* = _dragProps[3] + _loc_3;
            var _loc_6:* = this.coreInterface.snapCheck(this, _loc_4, _loc_5);
            _loc_4 = _loc_6[0];
            _loc_5 = _loc_6[1];
            if (_loc_4 < 0)
            {
                _loc_4 = 0;
            }
            if (_loc_5 < 0)
            {
                _loc_5 = 0;
            }
            if (_loc_4 + this.width > stage.stageWidth)
            {
                _loc_4 = stage.stageWidth - this.width;
            }
            if (_loc_5 + this.height > stage.stageHeight)
            {
                _loc_5 = stage.stageHeight - this.height;
            }
            this.x = _loc_4;
            this.y = _loc_5;
            return;
        }// end function

        override protected function onWindowStopDrag(event:MouseEvent) : void
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.onWindowDragging, false);
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.onWindowStopDrag, false);
            return;
        }// end function

        function __setProp_titleBtn_Scene1_titleBtn_0()
        {
            try
            {
                titleBtn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            titleBtn.autoRepeat = false;
            titleBtn.autoSize = "none";
            titleBtn.enabled = true;
            titleBtn.focusable = false;
            titleBtn.groupName = "";
            titleBtn.label = "";
            titleBtn.overlayAlign = "none";
            titleBtn.overlayImg = "";
            titleBtn.overlayPadding = {x:0, y:0};
            titleBtn.preventAutoSize = false;
            titleBtn.selected = false;
            titleBtn.toggle = false;
            titleBtn.visible = true;
            try
            {
                titleBtn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_closeBtn_Scene1_closeBtn_0()
        {
            try
            {
                closeBtn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            closeBtn.autoRepeat = false;
            closeBtn.autoSize = "none";
            closeBtn.enabled = true;
            closeBtn.focusable = false;
            closeBtn.groupName = "";
            closeBtn.label = "";
            closeBtn.overlayAlign = "none";
            closeBtn.overlayImg = "";
            closeBtn.overlayPadding = {x:0, y:0};
            closeBtn.preventAutoSize = false;
            closeBtn.selected = false;
            closeBtn.toggle = false;
            closeBtn.visible = true;
            try
            {
                closeBtn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
