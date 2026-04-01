package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.text.*;
    import flash.utils.*;
    import ran.ui.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;
    import scaleform.clik.utils.*;
    import scaleform.gfx.*;

    public class MChatLog extends UIComponent
    {
        protected var _lockToBottom:Boolean = true;
        protected var _isInit:Boolean = false;
        protected var _logID:int = -1;
        public var scrollBar:ScrollBar;
        public var textField:TextField;
        public var background:MovieClip;
        private var mapLink:Dictionary;
        private var arrReferName:Array;
        private var virtualRemoveTextLength:Object = 0;

        public function MChatLog()
        {
            if (DataAdapter.registerMessageLogListener != null)
            {
                DataAdapter.registerMessageLogListener(this.onNewLogMessage);
            }
            addEventListener(Event.ADDED_TO_STAGE, this.OnAddedStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.unregisterListeners);
            this.mapLink = new Dictionary();
            this.arrReferName = new Array();
            return;
        }// end function

        public function set logID(param1:int) : void
        {
            this._logID = param1;
            return;
        }// end function

        public function get logID() : int
        {
            return this._logID;
        }// end function

        override protected function preInitialize() : void
        {
            constraints = new Constraints(this, ConstrainMode.REFLOW);
            return;
        }// end function

        override protected function configUI() : void
        {
            if (this._isInit == true)
            {
                return;
            }
            super.configUI();
            constraints.addElement("scrollBar", this.scrollBar, Constraints.TOP | Constraints.BOTTOM);
            constraints.addElement("textField", this.textField, Constraints.ALL);
            constraints.addElement("background", this.background, Constraints.ALL);
            this.scrollBar.addEventListener(Event.SCROLL, this.handleScroll, false, 0, true);
            tabEnabled = false;
            tabChildren = false;
            this.textField.text = "";
            this.textField.selectable = false;
            this.textField.doubleClickEnabled = true;
            this.textField.addEventListener(MouseEvent.CLICK, this.handleMouseClick, false, 0, true);
            this.textField.addEventListener(MouseEvent.DOUBLE_CLICK, this.handleMouseDClick, false, 0, true);
            this._isInit = true;
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.SIZE))
            {
                constraints.update(_width, _height);
                this.updateLogState();
            }
            return;
        }// end function

        public function AddChatLog(param1:String, param2:uint, param3:Array, param4:Object) : void
        {
            var _loc_8:* = null;
            var _loc_5:* = this.textField.length;
            param1 = param1 + "\n";
            this.textField.appendText(param1);
            var _loc_6:* = new TextFormat();
            _loc_6.color = param2;
            this.textField.setTextFormat(_loc_6, _loc_5, this.textField.length);
            var _loc_7:* = 0;
            while (_loc_7 < param3.length)
            {
                
                _loc_8 = param3[_loc_7];
                _loc_6 = new TextFormat();
                _loc_6.color = _loc_8.color;
                this.textField.setTextFormat(_loc_6, _loc_5 + _loc_8.begin, _loc_5 + _loc_8.end);
                _loc_7++;
            }
            if (param4.begin != 0 && param4.end != 0)
            {
                param4.begin = param4.begin + (_loc_5 + this.virtualRemoveTextLength);
                param4.end = param4.end + (_loc_5 + this.virtualRemoveTextLength);
                param4.savedType = this.logID;
                this.arrReferName.push(param4);
            }
            this.updateLogState();
            return;
        }// end function

        public function AddLinkLog(param1:String, param2:uint, param3:Array, param4:Array, param5:Object) : void
        {
            var _loc_9:* = null;
            var _loc_10:* = null;
            var _loc_6:* = this.textField.length;
            param1 = param1 + "\n";
            this.textField.appendText(param1);
            var _loc_7:* = new TextFormat();
            _loc_7.color = param2;
            this.textField.setTextFormat(_loc_7, _loc_6, this.textField.length);
            var _loc_8:* = 0;
            _loc_8 = 0;
            while (_loc_8 < param3.length)
            {
                
                _loc_9 = param3[_loc_8];
                _loc_7 = new TextFormat();
                _loc_7.color = _loc_9.color;
                this.textField.setTextFormat(_loc_7, _loc_6 + _loc_9.begin, _loc_6 + _loc_9.end);
                _loc_8++;
            }
            _loc_8 = 0;
            while (_loc_8 < param4.length)
            {
                
                _loc_10 = param4[_loc_8];
                _loc_10.startPos = _loc_10.startPos + (_loc_6 + this.virtualRemoveTextLength);
                _loc_10.endPos = _loc_10.endPos + (_loc_6 + this.virtualRemoveTextLength);
                _loc_7 = new TextFormat();
                _loc_7.color = _loc_10.textColor;
                this.textField.setTextFormat(_loc_7, _loc_10.startPos - this.virtualRemoveTextLength, _loc_10.endPos - this.virtualRemoveTextLength);
                this.mapLink[_loc_10.linkIndex] = _loc_10;
                _loc_8++;
            }
            if (param5.begin != 0 && param5.end != 0)
            {
                param5.begin = param5.begin + (_loc_6 + this.virtualRemoveTextLength);
                param5.end = param5.end + (_loc_6 + this.virtualRemoveTextLength);
                param5.savedType = this.logID;
                this.arrReferName.push(param5);
            }
            this.updateLogState();
            return;
        }// end function

        public function updateLogState() : void
        {
            this.strip();
            if (this._lockToBottom)
            {
                this.textField.scrollV = this.textField.maxScrollV;
            }
            return;
        }// end function

        public function strip() : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            var _loc_1:* = false;
            while (this.textField.numLines > 1000)
            {
                
                _loc_2 = this.textField.getFirstCharInParagraph(0);
                _loc_3 = this.textField.getParagraphLength(0);
                this.textField.replaceText(_loc_2, _loc_2 + _loc_3, "");
                this.virtualRemoveTextLength = this.virtualRemoveTextLength + _loc_3;
                _loc_1 = true;
            }
            if (_loc_1 == true)
            {
                this.Clear();
                DataAdapter.chatLogRefresh();
            }
            return;
        }// end function

        protected function onNewLogMessage(param1:int, param2:String, param3:uint, param4:Array, param5:Array, param6:Object) : void
        {
            if (this._isInit == false)
            {
                this.configUI();
            }
            if (this.logID == param1)
            {
                if (param5.length == 0)
                {
                    this.AddChatLog(param2, param3, param4, param6);
                }
                else
                {
                    this.AddLinkLog(param2, param3, param4, param5, param6);
                }
            }
            return;
        }// end function

        public function Clear() : void
        {
            this.textField.text = "";
            this.arrReferName.length = 0;
            this.mapLink = new Dictionary();
            this.updateLogState();
            return;
        }// end function

        protected function OnAddedStage(event:Event) : void
        {
            if (this.logID == -1)
            {
                return;
            }
            if (DataAdapter.registerMessageLogListener != null)
            {
                DataAdapter.registerMessageLogListener(this.onNewLogMessage);
            }
            return;
        }// end function

        protected function unregisterListeners(event:Event) : void
        {
            DataAdapter.unregisterMessageLogListener(this.onNewLogMessage);
            return;
        }// end function

        protected function handleScroll(event:Event) : void
        {
            this._lockToBottom = this.scrollBar.position >= this.textField.maxScrollV;
            return;
        }// end function

        protected function handleMouseClick(param1:MouseEventEx) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = 0;
            var _loc_6:* = null;
            var _loc_2:* = this.textField.getCharIndexAtPoint(this.textField.mouseX, this.textField.mouseY) + this.virtualRemoveTextLength;
            if (_loc_2 == -1)
            {
                return;
            }
            if (MouseEventEx.LEFT_BUTTON == param1.buttonIdx)
            {
                for (_loc_3 in this.mapLink)
                {
                    
                    _loc_4 = _loc_8[_loc_3];
                    if (_loc_4.startPos <= _loc_2 && _loc_4.endPos >= _loc_2)
                    {
                        ExternalInterface.call("OnChatLinkClick", _loc_4.linkIndex);
                        return;
                    }
                }
            }
            else if (MouseEventEx.RIGHT_BUTTON == param1.buttonIdx)
            {
                _loc_5 = 0;
                while (_loc_5 < this.arrReferName.length)
                {
                    
                    _loc_6 = this.arrReferName[_loc_5];
                    if (_loc_6.begin <= _loc_2 && _loc_6.end >= _loc_2)
                    {
                        ExternalInterface.call("OnChatReferName", _loc_6.name);
                        return;
                    }
                    _loc_5++;
                }
            }
            return;
        }// end function

        protected function handleMouseDClick(param1:MouseEventEx) : void
        {
            var _loc_3:* = 0;
            var _loc_4:* = null;
            var _loc_2:* = this.textField.getCharIndexAtPoint(this.textField.mouseX, this.textField.mouseY) + this.virtualRemoveTextLength;
            if (_loc_2 == -1)
            {
                return;
            }
            if (MouseEventEx.LEFT_BUTTON == param1.buttonIdx)
            {
                _loc_3 = 0;
                while (_loc_3 < this.arrReferName.length)
                {
                    
                    _loc_4 = this.arrReferName[_loc_3];
                    if (_loc_4.savedType == this.logID && _loc_4.begin <= _loc_2 && _loc_4.end >= _loc_2)
                    {
                        ExternalInterface.call("OnChatWhisper", _loc_4.name);
                        return;
                    }
                    _loc_3++;
                }
            }
            return;
        }// end function

    }
}
