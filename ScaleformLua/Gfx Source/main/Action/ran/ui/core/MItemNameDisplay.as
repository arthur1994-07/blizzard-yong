package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.text.*;
    import scaleform.gfx.*;

    public class MItemNameDisplay extends MovieClip
    {
        public var textField:TextField;
        public var bg:MovieClip;
        private var offsetBgWidth:int = 0;
        public var origX:Number = 0;
        public var origY:Number = 0;
        private var pntIndex:int = 0;
        private var _id:uint = 0;
        private var _crow:int = 0;
        private var _enabledClick:Boolean = false;

        public function MItemNameDisplay()
        {
            this.offsetBgWidth = this.bg.width - this.textField.width;
            this.enabledClick = false;
            InteractiveObjectEx.setHitTestDisable(this.textField, true);
            addEventListener(MouseEvent.ROLL_OVER, this.onRollOver, false, 0, true);
            addEventListener(MouseEvent.ROLL_OUT, this.onRollOut, false, 0, true);
            addEventListener(MouseEvent.CLICK, this.onClick, false, 0, true);
            return;
        }// end function

        public function get text() : String
        {
            return this.textField.text;
        }// end function

        public function set text(param1:String) : void
        {
            this.textField.htmlText = param1;
            this.bg.width = this.textField.textWidth + this.offsetBgWidth + 4;
            return;
        }// end function

        public function get id() : uint
        {
            return this._id;
        }// end function

        public function set id(param1:uint) : void
        {
            this._id = param1;
            return;
        }// end function

        public function get crow() : int
        {
            return this._crow;
        }// end function

        public function set crow(param1:int) : void
        {
            this._crow = param1;
            return;
        }// end function

        public function get enabledClick() : Boolean
        {
            return this._enabledClick;
        }// end function

        public function set enabledClick(param1:Boolean) : void
        {
            this._enabledClick = param1;
            InteractiveObjectEx.setHitTestDisable(this, !this._enabledClick);
            if (this._enabledClick == false)
            {
                this.onRollOut(null);
            }
            else
            {
                this.origX = this.x;
                this.origY = this.y;
            }
            return;
        }// end function

        protected function onRollOver(event:MouseEvent) : void
        {
            this.bg.gotoAndStop("over");
            var _loc_2:* = this.parent as MovieClip;
            if (_loc_2 == null)
            {
                return;
            }
            this.pntIndex = _loc_2.getChildIndex(this);
            _loc_2.removeChild(this);
            _loc_2.addChild(this);
            return;
        }// end function

        protected function onRollOut(event:MouseEvent) : void
        {
            this.bg.gotoAndStop("up");
            var _loc_2:* = this.parent as MovieClip;
            if (_loc_2 == null)
            {
                return;
            }
            _loc_2.removeChild(this);
            _loc_2.addChildAt(this, this.pntIndex);
            return;
        }// end function

        protected function onClick(param1:MouseEventEx) : void
        {
            if (param1.buttonIdx != MouseEventEx.LEFT_BUTTON)
            {
                return;
            }
            ExternalInterface.call("OnItemNameClick", this._id, this._crow);
            return;
        }// end function

    }
}
