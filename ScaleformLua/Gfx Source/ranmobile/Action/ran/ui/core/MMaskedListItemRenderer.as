package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import scaleform.clik.core.*;

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
            this.state = "up";
            addEventListener(Event.ENTER_FRAME, this.onEnter, false, 0, true);
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
            return;
        }// end function

        protected function onEnter(event:Event) : void
        {
            removeEventListener(Event.ENTER_FRAME, this.onEnter);
            return;
        }// end function

        public function updateText() : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
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
                if (!this[_loc_4])
                {
                    break;
                }
                this[_loc_4].htmlText = this.data[_loc_3];
                _loc_1++;
            }
            var _loc_2:* = 0;
            while (_loc_2 < numChildren)
            {
                
                _loc_5 = getChildAt(_loc_2) as UIComponent;
                if (_loc_5 != null)
                {
                }
                else
                {
                    _loc_6 = getChildAt(_loc_2) as InteractiveObject;
                    if (_loc_6)
                    {
                        _loc_6.mouseEnabled = false;
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
            return;
        }// end function

        protected function onOut(event:MouseEvent) : void
        {
            this.onUp(event);
            return;
        }// end function

    }
}
