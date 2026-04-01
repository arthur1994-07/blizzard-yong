package ran.ui.core
{
    import fl.motion.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.utils.*;
    import ran.ui.*;
    import ran.ui.events.*;
    import ran.ui.slot.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.managers.*;
    import scaleform.clik.motion.*;
    import scaleform.gfx.*;

    public class MDragTarget extends DragSlot implements IGameSlot
    {
        protected var _tooltip:String;
        protected var _binding:String;
        protected var _index:uint;
        protected var _dragIconGhost:MovieClip;
        protected var _lastIconPath:String;
        protected var lastWrapPath:String = "";
        protected var lastLevelPath:String = "";
        public var dropIndicator:MovieClip;
        public var slotUse:MovieClip;
        public var coolDown:MovieClip;
        public var valueAmount:TextField;
        public var wrapIcon:Sprite;
        public var levelIcon:Sprite;
        public var opIcon:Sprite;
        public var setSlotIndication:Sprite;
        protected var coolDownTween:Tween;
        protected var _lock:Boolean = false;
        protected var _useCoolDown:Boolean = false;
        protected var _iconForceUpdate:Boolean = false;

        public function MDragTarget()
        {
            addEventListener(Event.ADDED_TO_STAGE, this.AddedToStage, false, 0, true);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage, false, 0, true);
            mouseChildren = false;
            if (this.slotUse)
            {
                this.slotUse.mouseEnabled = false;
                this.slotUse.mouseChildren = false;
            }
            InteractiveObjectEx.setHitTestDisable(this.slotUse, true);
            InteractiveObjectEx.setHitTestDisable(this.coolDown, true);
            return;
        }// end function

        public function get lock() : Boolean
        {
            return this._lock;
        }// end function

        public function set lock(param1:Boolean) : void
        {
            this._lock = param1;
            return;
        }// end function

        public function get useCoolDown() : Boolean
        {
            return this._useCoolDown;
        }// end function

        public function set useCoolDown(param1:Boolean) : void
        {
            this._useCoolDown = param1;
            return;
        }// end function

        public function get iconForceUpdate() : Boolean
        {
            return this._iconForceUpdate;
        }// end function

        public function set iconForceUpdate(param1:Boolean)
        {
            this._iconForceUpdate = param1;
            return;
        }// end function

        public function get tooltip() : Object
        {
            if (data)
            {
                return DataAdapter.getSlotTooltip(this._binding);
            }
            return null;
        }// end function

        public function get subTooltip() : Object
        {
            if (data)
            {
                return DataAdapter.getSlotSubTooltip(this._binding);
            }
            return null;
        }// end function

        public function get addSlotBinding() : String
        {
            return DataAdapter.getAddSlotBinding(this._binding);
        }// end function

        public function get addSlotCount() : int
        {
            return DataAdapter.getAddSlotCount(this._binding);
        }// end function

        public function get tradeSlotBinding() : String
        {
            return DataAdapter.getTradeSlotBinding(this._binding);
        }// end function

        public function get tradeSlotCount() : int
        {
            return DataAdapter.getTradeSlotCount(this._binding);
        }// end function

        public function ShowTooltipSlot(param1:String) : void
        {
            if (data)
            {
                DataAdapter.showTooltipSlot_bySlot(this._binding, param1);
            }
            return;
        }// end function

        public function get index() : uint
        {
            return this._index;
        }// end function

        public function set index(param1:uint) : void
        {
            this._index = param1;
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return super.enabled;
        }// end function

        override public function set enabled(param1:Boolean) : void
        {
            super.enabled = param1;
            setState(this.enabled ? ("up") : ("disabled"));
            mouseEnabled = true;
            if (param1 == true)
            {
                addEventListener(MouseEvent.MOUSE_OVER, handleMouseOver, true, 0, true);
                addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown, false, 0, true);
            }
            else
            {
                removeEventListener(MouseEvent.MOUSE_OVER, handleMouseOver, true);
                removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown, false);
            }
            return;
        }// end function

        public function showAcceptDrop(param1:Boolean) : void
        {
            if (this.dropIndicator)
            {
                this.dropIndicator.gotoAndPlay(param1 ? ("show") : ("hide"));
            }
            return;
        }// end function

        public function get binding() : String
        {
            return this._binding;
        }// end function

        public function set binding(param1:String) : void
        {
            this.deleteBinding(null);
            this._binding = param1;
            if (this.stage == null)
            {
                return;
            }
            this.createBinding(null);
            return;
        }// end function

        protected function AddedToStage(event:Event) : void
        {
            this.deleteBinding(null);
            this.createBinding(null);
            return;
        }// end function

        public function TooltipException() : void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.AddedToStage);
            return;
        }// end function

        protected function createBinding(event:Event) : void
        {
            if (!this._binding)
            {
                return;
            }
            DataBinding.createBinding(this._binding, this.setItemSlotData, this);
            addEventListener(Event.REMOVED_FROM_STAGE, this.deleteBinding);
            return;
        }// end function

        protected function deleteBinding(event:Event) : void
        {
            if (!this._binding)
            {
                return;
            }
            DataBinding.deleteBinding(this._binding, this.setItemSlotData, this);
            removeEventListener(Event.REMOVED_FROM_STAGE, this.deleteBinding);
            return;
        }// end function

        protected function setItemSlotData(param1:Object) : void
        {
            this.data = param1;
            this.clearCooldown();
            if (param1 != null)
            {
                dispatchEvent(new TooltipEvent(TooltipEvent.REGISTER_ELEMENT, true, false, this));
            }
            else
            {
                dispatchEvent(new TooltipEvent(TooltipEvent.UNREGISTER_ELEMENT, true, false, this));
            }
            invalidate(InvalidationType.DATA);
            validateNow();
            return;
        }// end function

        public function clearCooldown() : void
        {
            if (this.coolDown)
            {
                this.coolDown.gotoAndStop(1);
            }
            if (this.slotUse)
            {
                this.slotUse.visible = false;
            }
            return;
        }// end function

        public function highlight() : void
        {
            if (this.dropIndicator)
            {
                this.dropIndicator.gotoAndPlay("show");
            }
            return;
        }// end function

        public function unhighlight() : void
        {
            if (this.dropIndicator)
            {
                this.dropIndicator.gotoAndPlay("hide");
            }
            return;
        }// end function

        public function updateCooldown(param1:Number) : void
        {
            var _loc_2:* = 0;
            if (this.coolDown)
            {
                _loc_2 = Math.floor((this.coolDown.totalFrames - 2) * param1) + 3;
                this.coolDown.gotoAndStop(_loc_2);
            }
            return;
        }// end function

        public function endCooldown() : void
        {
            if (this.coolDown)
            {
                this.coolDown.gotoAndStop(1);
            }
            if (this.slotUse)
            {
                this.slotUse.visible = true;
                this.slotUse.gotoAndPlay("on");
            }
            return;
        }// end function

        public function removeIconGhost() : void
        {
            if (this._dragIconGhost)
            {
                contentCanvas.removeChild(this._dragIconGhost);
                content = this._dragIconGhost;
                this._dragIconGhost = null;
            }
            return;
        }// end function

        override public function handleDragStartEvent(event:DragEvent, param2:Number) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (DragManager.GetDragTarget() == null && DragManager.GetDragOriginTarget() == null)
            {
                return;
            }
            if (data == null)
            {
                return;
            }
            if (data is Object && !(data is String) && data.iconPath && data.iconPath != "")
            {
                if (this._dragIconGhost)
                {
                    contentCanvas.removeChild(this._dragIconGhost);
                    this._dragIconGhost = null;
                }
                _loc_3 = getDefinitionByName("Icon") as Class;
                _loc_4 = new _loc_3 as Icon;
                _loc_5 = new Color();
                _loc_5.setTint(0, param2);
                _loc_4.transform.colorTransform = _loc_5;
                this._dragIconGhost = _loc_4;
                this.updateIconWithData(this._dragIconGhost as Icon);
                contentCanvas.addChild(this._dragIconGhost);
                this.ReleaseWrapIcon();
                this.LoadWrapIcon();
                this.LoadLevelIcon();
                this.ReleaseOPIcon();
                this.LoadOPIcon();
                this.ReleaseSetSlotIndicationIcon();
                this.LoadSetSlot_IndicationIcon();
                if (this.wrapIcon)
                {
                    this.wrapIcon.transform.colorTransform = _loc_5;
                }
            }
            return;
        }// end function

        override public function handleDropEvent(event:DragEvent) : Boolean
        {
            return true;
        }// end function

        override public function handleDragEndEvent(event:DragEvent, param2:Boolean) : void
        {
            this.removeIconGhost();
            this.ReleaseWrapIcon();
            return;
        }// end function

        override protected function draw() : void
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            super.draw();
            if (isInvalid(InvalidationType.DATA))
            {
                if (data != null && data is Object && !(data is String))
                {
                    if (this.valueAmount)
                    {
                        if (data.bShowGrade == false)
                        {
                            if (data.bVisibleOneCount != null && data.bVisibleOneCount == true)
                            {
                                this.valueAmount.text = data.count != null ? (data.count) : ("");
                            }
                            else
                            {
                                this.valueAmount.text = data.count != null && data.count > 1 ? (data.count) : ("");
                            }
                        }
                        else if (data.count > 0)
                        {
                            this.valueAmount.text = data.count != null ? ("+" + data.count) : ("");
                        }
                        else
                        {
                            this.valueAmount.text = "";
                        }
                        _loc_1 = this.valueAmount.getTextFormat();
                        _loc_1.color = data.dwCountColor;
                        this.valueAmount.setTextFormat(_loc_1);
                    }
                    if (data.iconPath != null && data.iconPath != "")
                    {
                        if (this.iconForceUpdate == true || this._lastIconPath != data.iconPath || (content as Icon).isLoading == true)
                        {
                            _loc_2 = getDefinitionByName("Icon") as Class;
                            _loc_3 = new _loc_2 as Icon;
                            this.updateIconWithData(_loc_3);
                            content = _loc_3;
                        }
                        this.LoadWrapIcon();
                        this.LoadLevelIcon();
                        this.LoadOPIcon();
                        this.LoadSetSlot_IndicationIcon();
                        if (content)
                        {
                            _loc_4 = new Color();
                            if (data.bShowGrade == false && data.count == 0)
                            {
                                _loc_4.setTint(0, 0.5);
                            }
                            content.transform.colorTransform = _loc_4;
                            if (this.wrapIcon)
                            {
                                this.wrapIcon.transform.colorTransform = _loc_4;
                            }
                        }
                    }
                    this._lastIconPath = data.iconPath;
                    if (this._useCoolDown == true)
                    {
                        this.SetCoolDownTween(data.coolDownTime, data.coolDownRatio);
                    }
                }
                else
                {
                    if (stage != null)
                    {
                        _loc_5 = new TooltipEvent(TooltipEvent.HIDE);
                        _loc_5.elem = this;
                        stage.dispatchEvent(_loc_5);
                    }
                    if (this.valueAmount)
                    {
                        this.valueAmount.text = "";
                    }
                    content = null;
                    this._lastIconPath = null;
                    this.ReleaseWrapIcon();
                    this.ReleaseLevelIcon();
                    this.ReleaseOPIcon();
                    this.ReleaseSetSlotIndicationIcon();
                }
            }
            return;
        }// end function

        public function SetCoolDownTween(param1:Number, param2:Number) : void
        {
            data.coolDownTime = param1;
            data.coolDownRatio = param2;
            if (data.coolDownTime <= 0)
            {
                if (this.coolDownTween != null)
                {
                    Tween.removeTween(this.coolDownTween);
                }
                this.updateCooldown(1);
            }
            else
            {
                this.updateCooldown(data.coolDownRatio);
                if (this.coolDownTween != null)
                {
                    Tween.removeTween(this.coolDownTween);
                }
                this.coolDownTween = new Tween(data.coolDownTime * 1000, data, {coolDownRatio:1}, {onChange:this.onUpdateCoolDown});
            }
            return;
        }// end function

        protected function onUpdateCoolDown(param1:Tween) : void
        {
            if (data == null)
            {
                Tween.removeTween(this.coolDownTween);
                return;
            }
            if (data.coolDownRatio >= 1)
            {
                this.endCooldown();
                Tween.removeTween(this.coolDownTween);
            }
            else
            {
                this.updateCooldown(data.coolDownRatio);
            }
            return;
        }// end function

        protected function updateIconWithData(param1:Icon) : void
        {
            if (param1 && data is Object)
            {
                param1.loadImage(data.iconPath != null ? (data.iconPath) : (""));
            }
            return;
        }// end function

        protected function onRemovedFromStage(event:Event) : void
        {
            return;
        }// end function

        override public function toString() : String
        {
            return "[MMOKit MDragTarget " + name + "]";
        }// end function

        protected function LoadWrapIcon() : void
        {
            var _loc_1:* = null;
            if (data == null || data.wrapPath == "")
            {
                this.ReleaseWrapIcon();
            }
            else
            {
                if (data.wrapPath == this.lastWrapPath)
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
                _loc_1.loadImage(data.wrapPath);
                InteractiveObjectEx.setHitTestDisable(_loc_1, true);
                contentCanvas.addChild(_loc_1);
                this.wrapIcon = _loc_1;
                this.lastWrapPath = data.wrapPath;
            }
            return;
        }// end function

        protected function LoadLevelIcon() : void
        {
            var _loc_1:* = null;
            if (data == null || data.levelIconPath == "")
            {
                this.ReleaseLevelIcon();
            }
            else
            {
                if (data.levelIconPath == this.lastLevelPath)
                {
                }
                if (this.levelIcon != null)
                {
                    contentCanvas.removeChild(this.levelIcon);
                }
                _loc_1 = new Icon();
                if (_loc_1 == null)
                {
                    return;
                }
                _loc_1.loadImage(data.levelIconPath);
                InteractiveObjectEx.setHitTestDisable(_loc_1, true);
                contentCanvas.addChild(_loc_1);
                this.levelIcon = _loc_1;
                this.lastLevelPath = data.levelIconPath;
            }
            return;
        }// end function

        protected function LoadOPIcon() : void
        {
            var _loc_1:* = null;
            if (data == null || data.opPath == null || data.opPath == "")
            {
                this.ReleaseOPIcon();
            }
            else
            {
                if (this.opIcon != null)
                {
                    contentCanvas.removeChild(this.opIcon);
                }
                _loc_1 = new Icon();
                if (_loc_1 == null)
                {
                    return;
                }
                _loc_1.loadImage(data.opPath);
                InteractiveObjectEx.setHitTestDisable(_loc_1, true);
                contentCanvas.addChild(_loc_1);
                this.opIcon = _loc_1;
            }
            return;
        }// end function

        protected function LoadSetSlot_IndicationIcon() : void
        {
            var _loc_1:* = null;
            if (data == null || data.strSetSlot_IndicationPath == null || data.strSetSlot_IndicationPath == "")
            {
                this.ReleaseSetSlotIndicationIcon();
            }
            else
            {
                if (this.setSlotIndication != null)
                {
                    contentCanvas.removeChild(this.setSlotIndication);
                }
                _loc_1 = new Icon();
                if (_loc_1 == null)
                {
                    return;
                }
                _loc_1.loadImage(data.strSetSlot_IndicationPath);
                InteractiveObjectEx.setHitTestDisable(_loc_1, true);
                contentCanvas.addChild(_loc_1);
                this.setSlotIndication = _loc_1;
            }
            return;
        }// end function

        protected function ReleaseWrapIcon() : void
        {
            if (this.wrapIcon)
            {
                contentCanvas.removeChild(this.wrapIcon);
                this.wrapIcon = null;
            }
            this.lastWrapPath = "";
            return;
        }// end function

        protected function ReleaseLevelIcon() : void
        {
            if (this.levelIcon)
            {
                contentCanvas.removeChild(this.levelIcon);
                this.levelIcon = null;
            }
            this.lastLevelPath = "";
            return;
        }// end function

        protected function ReleaseOPIcon() : void
        {
            if (this.opIcon)
            {
                contentCanvas.removeChild(this.opIcon);
                this.opIcon = null;
            }
            return;
        }// end function

        protected function ReleaseSetSlotIndicationIcon() : void
        {
            if (this.setSlotIndication)
            {
                contentCanvas.removeChild(this.setSlotIndication);
                this.setSlotIndication = null;
            }
            return;
        }// end function

    }
}
