package scaleform.clik.controls
{
    import flash.display.*;
    import flash.events.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.clik.managers.*;
    import scaleform.gfx.*;

    public class DragSlot extends UIComponent implements IDragSlot
    {
        protected var _mouseDownX:Number;
        protected var _mouseDownY:Number;
        protected var _content:Sprite;
        protected var _data:Object;
        protected var _stageRef:Stage = null;
        protected var _newFrame:String;
        protected var _stateMap:Object;
        protected var _state:String;
        public var contentCanvas:Sprite;

        public function DragSlot()
        {
            this._stateMap = {up:["up"], over:["over"], down:["down"], release:["release", "over"], out:["out", "up"], disabled:["disabled"], selecting:["selecting", "over"]};
            if (!this.contentCanvas)
            {
                this.contentCanvas = new Sprite();
                addChild(this.contentCanvas);
            }
            if (stage)
            {
                DragManager.init(stage);
            }
            trackAsMenu = true;
            return;
        }// end function

        public function get data() : Object
        {
            return this._data;
        }// end function

        public function set data(param1:Object) : void
        {
            this._data = param1;
            invalidateData();
            return;
        }// end function

        public function get content() : Sprite
        {
            return this._content;
        }// end function

        public function set content(param1:Sprite) : void
        {
            if (param1 != this._content)
            {
                if (this._content)
                {
                    if (this.contentCanvas.contains(this._content))
                    {
                        this.contentCanvas.removeChild(this._content);
                    }
                }
                this._content = param1;
                if (this._content == null)
                {
                    return;
                }
                if (this._content != this)
                {
                    this.contentCanvas.addChild(this._content);
                    this._content.x = 0;
                    this._content.y = 0;
                    this._content.mouseChildren = false;
                }
            }
            return;
        }// end function

        public function setStage(param1:Stage) : void
        {
            if (this._stageRef == null && param1 != null)
            {
                this._stageRef = param1;
                DragManager.init(param1);
            }
            return;
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            addEventListener(MouseEvent.MOUSE_OVER, this.handleMouseOver, true, 0, true);
            addEventListener(MouseEvent.MOUSE_DOWN, this.handleMouseDown, false, 0, true);
            addEventListener(MouseEvent.ROLL_OVER, this.handleMouseRollOver, false, 0, true);
            addEventListener(MouseEvent.ROLL_OUT, this.handleMouseRollOut, false, 0, true);
            return;
        }// end function

        override protected function draw() : void
        {
            super.draw();
            if (isInvalid(InvalidationType.STATE))
            {
                if (this._newFrame)
                {
                    gotoAndPlay(this._newFrame);
                    this._newFrame = null;
                }
            }
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK DragSlot " + name + "]";
        }// end function

        protected function handleMouseOver(event:MouseEvent) : void
        {
            if (DragManager.inDrag())
            {
            }
            else if (this.content != null)
            {
            }
            return;
        }// end function

        protected function handleMouseDown(event:MouseEvent) : void
        {
            if (DragManager.inDrag() || !enabled)
            {
                return;
            }
            if (this._content != null)
            {
                stage.addEventListener(MouseEvent.MOUSE_UP, this.handleMouseUp, false, 0, true);
                stage.addEventListener(MouseEvent.MOUSE_MOVE, this.handleMouseMove, false, 0, true);
                this._mouseDownX = mouseX;
                this._mouseDownY = mouseY;
            }
            return;
        }// end function

        protected function handleMouseRollOver(event:MouseEvent) : void
        {
            if (!enabled)
            {
                return;
            }
            this.setState("over");
            return;
        }// end function

        protected function handleMouseRollOut(event:MouseEvent) : void
        {
            if (!enabled)
            {
                return;
            }
            this.setState("out");
            return;
        }// end function

        protected function cleanupDragListeners() : void
        {
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.handleMouseUp, false);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.handleMouseMove, false);
            this._mouseDownX = undefined;
            this._mouseDownY = undefined;
            return;
        }// end function

        protected function handleMouseMove(event:MouseEvent) : void
        {
            var _loc_2:* = null;
            if (mouseX > this._mouseDownX + 3 || mouseX < this._mouseDownX - 3 || mouseY > this._mouseDownY + 3 || mouseY < this._mouseDownY - 3)
            {
                this.cleanupDragListeners();
                _loc_2 = new DragEvent(DragEvent.DRAG_START, this._data, this, null, this._content);
                dispatchEventAndSound(_loc_2);
                this.handleDragStartEvent(_loc_2);
            }
            return;
        }// end function

        protected function handleMouseUp(param1:MouseEventEx) : void
        {
            this.cleanupDragListeners();
            this._content.x = 0;
            this._content.y = 0;
            dispatchEventAndSound(new ButtonEvent(ButtonEvent.CLICK));
            return;
        }// end function

        public function handleDragStartEvent(event:DragEvent) : void
        {
            return;
        }// end function

        public function handleDropEvent(event:DragEvent) : Boolean
        {
            var _loc_2:* = true;
            if (_loc_2)
            {
                this.content = event.dragSprite;
            }
            return _loc_2;
        }// end function

        public function handleDragEndEvent(event:DragEvent, param2:Boolean) : void
        {
            if (param2)
            {
                this.content = null;
            }
            else
            {
                this.contentCanvas.addChild(event.dragSprite);
                event.dragSprite.x = 0;
                event.dragSprite.y = 0;
            }
            return;
        }// end function

        protected function setState(param1:String) : void
        {
            var _loc_5:* = null;
            this._state = param1;
            var _loc_2:* = this._stateMap[param1];
            if (_loc_2 == null || _loc_2.length == 0)
            {
                return;
            }
            var _loc_3:* = _loc_2.length;
            var _loc_4:* = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_5 = _loc_2[_loc_4];
                if (_labelHash[_loc_5])
                {
                    this._newFrame = _loc_5;
                    invalidateState();
                    return;
                }
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

    }
}
