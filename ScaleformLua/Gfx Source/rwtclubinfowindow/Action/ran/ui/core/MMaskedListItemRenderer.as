package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;

    public class MMaskedListItemRenderer extends MovieClip
    {
        public var index:int = -1;
        public var indexSub:int = -1;
        public var key:String = "";
        public var selected:Boolean = false;
        public var state:Object = "";
        protected var _data:Object;

        public function MMaskedListItemRenderer()
        {
            doubleClickEnabled = true;
            addEventListener(MouseEvent.MOUSE_UP, this.onUp, false, 0, true);
            addEventListener(MouseEvent.MOUSE_DOWN, this.onDown, false, 0, true);
            addEventListener(MouseEvent.ROLL_OVER, this.onOver, false, 0, true);
            addEventListener(MouseEvent.ROLL_OUT, this.onOut, false, 0, true);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemove, false, 0, true);
            this.state = "up";
            return;
        }// end function

        public function get data() : Object
        {
            return this._data;
        }// end function

        public function set data(param1:Object) : void
        {
            this._data = param1;
            this.updateText();
            if (this.state == "over")
            {
                if (hasEventListener(Event.ENTER_FRAME) == false)
                {
                    addEventListener(Event.ENTER_FRAME, this.onEnter, false, 0, true);
                }
            }
            return;
        }// end function

        protected function onRemove(event:Event) : void
        {
            if (hasEventListener(Event.ENTER_FRAME) == true)
            {
                removeEventListener(Event.ENTER_FRAME, this.onEnter);
            }
            this.hideTooltip();
            return;
        }// end function

        public function updateText() : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = null;
            if (this.data == null)
            {
                return;
            }
            var _loc_1:* = 1;
            while (true)
            {
                
                _loc_3 = "label" + _loc_1;
                _loc_4 = "textField" + _loc_1;
                if (!this.data[_loc_3])
                {
                    break;
                }
                _loc_5 = this[_loc_4];
                if (!_loc_5)
                {
                    break;
                }
                _loc_5.htmlText = this.data[_loc_3];
                _loc_1++;
            }
            var _loc_2:* = 0;
            while (_loc_2 < numChildren)
            {
                
                _loc_6 = getChildAt(_loc_2) as UIComponent;
                if (_loc_6 != null)
                {
                }
                else
                {
                    _loc_7 = getChildAt(_loc_2) as InteractiveObject;
                    if (_loc_7)
                    {
                        _loc_7.mouseEnabled = false;
                    }
                }
                _loc_2++;
            }
            return;
        }// end function

        public function setState(param1:Boolean) : void
        {
            this.selected = param1;
            switch(this.state)
            {
                case "up":
                case "selected_up":
                {
                    this.onUp(null);
                    break;
                }
                case "over":
                case "selected_over":
                {
                    this.onOver(null);
                    break;
                }
                case "down":
                case "selected_down":
                {
                    this.onDown(null);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function showTooltip() : Boolean
        {
            if (stage == null)
            {
                return false;
            }
            if (this.data == null)
            {
                return false;
            }
            if (!this.data["tooltip"] || this.data["tooltip"].length == 0)
            {
                return false;
            }
            var _loc_1:* = 0;
            if (this.data["tooltipOffsetX"])
            {
                _loc_1 = _loc_1 + this.data["tooltipOffsetX"];
            }
            var _loc_2:* = 0;
            if (this.data["tooltipOffsetY"])
            {
                _loc_2 = _loc_2 + this.data["tooltipOffsetY"];
            }
            var _loc_3:* = new SimpleTooltipEvent(SimpleTooltipEvent.OPEN);
            _loc_3.localX = this.x + _loc_1;
            _loc_3.localY = this.y + _loc_2;
            _loc_3.component = this;
            var _loc_4:* = this.parent;
            while (_loc_4 != null)
            {
                
                _loc_3.localX = _loc_3.localX + _loc_4.x;
                _loc_3.localY = _loc_3.localY + _loc_4.y;
                _loc_4 = _loc_4.parent;
            }
            _loc_3.tooltip = this.data["tooltip"];
            _loc_3.htmlText = true;
            stage.dispatchEvent(_loc_3);
            return true;
        }// end function

        public function hideTooltip() : void
        {
            if (stage == null)
            {
                return;
            }
            var _loc_1:* = new SimpleTooltipEvent(SimpleTooltipEvent.CLOSE);
            _loc_1.component = this;
            _loc_1.removeUI = true;
            stage.dispatchEvent(_loc_1);
            return;
        }// end function

        protected function onUp(event:MouseEvent) : void
        {
            var _loc_2:* = "up";
            if (this.selected == true)
            {
                _loc_2 = "selected_" + _loc_2;
            }
            this.state = _loc_2;
            gotoAndPlay(_loc_2);
            this.updateText();
            return;
        }// end function

        protected function onDown(event:MouseEvent) : void
        {
            var _loc_2:* = "down";
            if (this.selected == true)
            {
                _loc_2 = "selected_" + _loc_2;
            }
            this.state = _loc_2;
            gotoAndPlay(_loc_2);
            this.updateText();
            return;
        }// end function

        protected function onOver(event:MouseEvent) : void
        {
            var _loc_2:* = "over";
            if (this.selected == true)
            {
                _loc_2 = "selected_" + _loc_2;
            }
            this.state = _loc_2;
            gotoAndPlay(_loc_2);
            this.updateText();
            this.showTooltip();
            if (hasEventListener(Event.ENTER_FRAME) == false)
            {
                addEventListener(Event.ENTER_FRAME, this.onEnter, false, 0, true);
            }
            return;
        }// end function

        protected function onOut(event:MouseEvent) : void
        {
            this.onUp(event);
            if (hasEventListener(Event.ENTER_FRAME) == true)
            {
                removeEventListener(Event.ENTER_FRAME, this.onEnter);
            }
            this.hideTooltip();
            return;
        }// end function

        protected function onEnter(event:Event) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_8:* = null;
            var _loc_9:* = null;
            if (stage == null)
            {
                return;
            }
            if (this.data == null)
            {
                return;
            }
            var _loc_2:* = true;
            var _loc_3:* = 1;
            while (true)
            {
                
                _loc_4 = "textField" + _loc_3;
                _loc_5 = this[_loc_4];
                if (!_loc_5)
                {
                    break;
                }
                _loc_6 = "tooltip" + _loc_3;
                if (!this.data[_loc_6])
                {
                }
                else
                {
                    _loc_7 = this.data[_loc_6];
                    if (_loc_7.length == 0)
                    {
                    }
                    else if (_loc_5.hitTestPoint(stage.mouseX, stage.mouseY) == true)
                    {
                        _loc_8 = new SimpleTooltipEvent(SimpleTooltipEvent.OPEN);
                        _loc_8.localX = _loc_5.x;
                        _loc_8.localY = _loc_5.y;
                        _loc_8.component = this;
                        _loc_9 = _loc_5.parent;
                        while (_loc_9 != null)
                        {
                            
                            _loc_8.localX = _loc_8.localX + _loc_9.x;
                            _loc_8.localY = _loc_8.localY + _loc_9.y;
                            _loc_9 = _loc_9.parent;
                        }
                        _loc_8.tooltip = _loc_7;
                        _loc_8.htmlText = true;
                        stage.dispatchEvent(_loc_8);
                        _loc_2 = false;
                        break;
                    }
                }
                _loc_3++;
            }
            if (_loc_2 == true)
            {
                if (this.showTooltip() == false)
                {
                    this.hideTooltip();
                }
            }
            return;
        }// end function

    }
}
