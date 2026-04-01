package ran.ui.slot
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.system.*;
    import ran.ui.*;
    import ran.ui.core.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.clik.managers.*;
    import scaleform.gfx.*;

    public class Slot extends MDragTarget implements IListItemRenderer
    {
        protected var _owner:UIComponent;
        protected var _selectable:Boolean = true;
        protected var _selected:Boolean = false;
        public var mcLock:MovieClip;
        public var mcColorMain:MovieClip;
        public var mcColorSub:MovieClip;
        public var wrapIcon:Sprite;
        public var mcOverlay:MovieClip;
        protected var lastWrapPath:String = "";
        protected var lastWrapMID:int = -1;
        protected var lastWrapSID:int = -1;
        protected var _mcOverlayImg:MovieClip;
        protected var _overlayImg:String = "";
        protected var _dragable:Boolean = false;
        protected var _isHold:Boolean = false;

        public function Slot()
        {
            slotUse.mouseEnabled = false;
            slotUse.mouseChildren = false;
            data = new Object();
            data["id"] = 0;
            data["name"] = "";
            data["iconPath"] = "";
            data["count"] = 0;
            data["MID"] = 0;
            data["SID"] = 0;
            data["dragable"] = true;
            data["coolDownTime"] = 0;
            data["coolDownRatio"] = 0;
            data["colorMain"] = 0;
            data["colorSub"] = 0;
            data["wrapPath"] = "";
            data["wrapMID"] = 0;
            data["wrapSID"] = 0;
            data["dwCountColor"] = 4294967295;
            return;
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            InteractiveObjectEx.setHitTestDisable(this.mcLock, true);
            InteractiveObjectEx.setHitTestDisable(this.mcColorMain, true);
            InteractiveObjectEx.setHitTestDisable(this.mcColorSub, true);
            this.mcLock.visible = this.lock;
            addEventListener(MouseEvent.CLICK, this.handleUseSlot, false, 0, true);
            return;
        }// end function

        public function get owner() : UIComponent
        {
            return this._owner;
        }// end function

        public function set owner(param1:UIComponent) : void
        {
            this._owner = param1;
            return;
        }// end function

        public function get selectable() : Boolean
        {
            return this._selectable;
        }// end function

        public function set selectable(param1:Boolean) : void
        {
            this._selectable = param1;
            return;
        }// end function

        public function get selected() : Boolean
        {
            return this._selected;
        }// end function

        public function set selected(param1:Boolean) : void
        {
            this._selected = param1;
            return;
        }// end function

        public function get expanded() : Boolean
        {
            return false;
        }// end function

        public function set expanded(param1:Boolean) : void
        {
            return;
        }// end function

        public function get checked() : Boolean
        {
            return false;
        }// end function

        public function set checked(param1:Boolean) : void
        {
            return;
        }// end function

        public function get dragable() : Boolean
        {
            return this._dragable;
        }// end function

        public function set dragable(param1:Boolean)
        {
            this._dragable = param1;
            return;
        }// end function

        public function get isHold() : Boolean
        {
            return this._isHold;
        }// end function

        override public function set lock(param1:Boolean) : void
        {
            _lock = param1;
            this.mcLock.visible = _lock;
            return;
        }// end function

        public function setListData(param1:ListData) : void
        {
            index = param1.index;
            gotoAndPlay("up");
            return;
        }// end function

        public function setData(param1:Object) : void
        {
            binding = String(param1);
            return;
        }// end function

        public function setLabelOffsetX(param1:int) : void
        {
            return;
        }// end function

        public function getLeafDataProvider() : DataProvider
        {
            return null;
        }// end function

        public function get overlayImg() : String
        {
            return this._overlayImg;
        }// end function

        public function set overlayImg(param1) : void
        {
            if (param1 == this._overlayImg)
            {
                return;
            }
            if (this._mcOverlayImg != null)
            {
                this.mcOverlay.removeChild(this._mcOverlayImg);
            }
            this._overlayImg = param1;
            var _loc_2:* = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null)
            {
                _loc_2 = loaderInfo.applicationDomain;
            }
            var _loc_3:* = _loc_2.getDefinition(param1) as Class;
            this._mcOverlayImg = new _loc_3 as MovieClip;
            if (this._mcOverlayImg == null)
            {
                trace("Warnning : " + this.name + " - overlayImg must be MovieClip.");
                return;
            }
            this.mcOverlay.addChild(this._mcOverlayImg);
            return;
        }// end function

        override protected function draw() : void
        {
            super.draw();
            if (isInvalid(InvalidationType.DATA) == true)
            {
                this.LoadWrapIcon();
                this.ColorChange();
            }
            return;
        }// end function

        override protected function handleMouseUp(param1:MouseEventEx) : void
        {
            var _loc_2:* = null;
            cleanupDragListeners();
            if (MouseEventEx.LEFT_BUTTON != param1.buttonIdx)
            {
                return;
            }
            if (DragManager.inDrag() || _content == null)
            {
                return;
            }
            if (param1.ctrlKey == true || param1.altKey == true || param1.shiftKey == true)
            {
                DataAdapter.notifyLeftMouseClick(this.binding, lock, param1.ctrlKey, param1.altKey, param1.shiftKey);
            }
            else if (this.dragable == true)
            {
                this._isHold = true;
                _loc_2 = new DragEvent(DragEvent.DRAG_START, _data, this, null, _content);
                dispatchEvent(new DragEvent(DragEvent.DRAG_START, _data, this, null, _content));
                handleDragStartEvent(_loc_2);
            }
            else
            {
                DataAdapter.notifyLeftMouseClick(this.binding, lock, false, false, false);
            }
            dispatchEvent(new ButtonEvent(ButtonEvent.CLICK));
            return;
        }// end function

        protected function handleUseSlot(param1:MouseEventEx) : void
        {
            if (MouseEventEx.RIGHT_BUTTON == param1.buttonIdx)
            {
                DataAdapter.notifyRightMouseClick(binding, lock, param1.ctrlKey, param1.altKey, param1.shiftKey);
            }
            return;
        }// end function

        override protected function handleMouseMove(event:MouseEvent) : void
        {
            var _loc_2:* = null;
            if (this.dragable == false)
            {
                return;
            }
            if (mouseX > _mouseDownX + 3 || mouseX < _mouseDownX - 3 || mouseY > _mouseDownY + 3 || mouseY < _mouseDownY - 3)
            {
                cleanupDragListeners();
                this._isHold = false;
                _loc_2 = new DragEvent(DragEvent.DRAG_START, _data, this, null, _content);
                dispatchEventAndSound(_loc_2);
                handleDragStartEvent(_loc_2);
            }
            return;
        }// end function

        override public function toString() : String
        {
            return "[Slot " + name + "]";
        }// end function

        protected function ColorChange() : void
        {
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            var _loc_4:* = 0;
            var _loc_5:* = null;
            if (this.mcColorMain == null || this.mcColorSub == null)
            {
                return;
            }
            if (data == null || data.colorMain == 0)
            {
                this.mcColorMain.visible = false;
                this.mcColorSub.visible = false;
            }
            else
            {
                this.mcColorMain.visible = true;
                this.mcColorSub.visible = true;
                _loc_1 = data.colorMain;
                _loc_2 = _loc_1 % 256;
                _loc_1 = _loc_1 / 256;
                _loc_3 = _loc_1 % 256;
                _loc_1 = _loc_1 / 256;
                _loc_4 = _loc_1 % 256;
                _loc_5 = this.mcColorMain.transform.colorTransform;
                _loc_5.redOffset = _loc_4;
                _loc_5.greenOffset = _loc_3;
                _loc_5.blueOffset = _loc_2;
                this.mcColorMain.transform.colorTransform = _loc_5;
                _loc_1 = data.colorSub;
                _loc_2 = _loc_1 % 256;
                _loc_1 = _loc_1 / 256;
                _loc_3 = _loc_1 % 256;
                _loc_1 = _loc_1 / 256;
                _loc_4 = _loc_1 % 256;
                _loc_5 = this.mcColorSub.transform.colorTransform;
                _loc_5.redOffset = _loc_4;
                _loc_5.greenOffset = _loc_3;
                _loc_5.blueOffset = _loc_2;
                this.mcColorSub.transform.colorTransform = _loc_5;
            }
            return;
        }// end function

        protected function LoadWrapIcon() : void
        {
            var _loc_1:* = null;
            if (data == null || data.wrapPath == "")
            {
                if (this.wrapIcon != null)
                {
                    contentCanvas.removeChild(this.wrapIcon);
                }
            }
            else
            {
                if (data.wrapPath == this.lastWrapPath && data.wrapMID == this.lastWrapMID && data.wrapSID == this.lastWrapSID)
                {
                    return;
                }
                if (this.wrapIcon != null)
                {
                    contentCanvas.removeChild(this.wrapIcon);
                }
                _loc_1 = new Icon();
                if (_loc_1 == null)
                {
                    return;
                }
                _loc_1.loadImage(data.wrapPath, data.wrapMID, data.wrapSID);
                InteractiveObjectEx.setHitTestDisable(_loc_1, true);
                contentCanvas.addChild(_loc_1);
                this.wrapIcon = _loc_1;
                this.lastWrapPath = data.wrapPath;
                this.lastWrapMID = data.wrapMID;
                this.lastWrapSID = data.wrapSID;
            }
            return;
        }// end function

    }
}
