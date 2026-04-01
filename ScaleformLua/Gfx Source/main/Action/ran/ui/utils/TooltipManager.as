package ran.ui.utils
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.utils.*;
    import ran.ui.*;
    import ran.ui.events.*;
    import scaleform.clik.core.*;
    import scaleform.clik.motion.*;

    public class TooltipManager extends Object
    {
        private var _tooltipUnit:BaseTooltipUnit;
        protected var _tooltipRef:MovieClip;
        protected var _hoverMode:Boolean;
        protected var _delayTimerID:Number;
        protected var _resetTimerID:Number;
        protected var _stage:Stage;
        protected var _minTooltipWidth:int = 200;
        protected var _maxTooltipWidth:int = 400;
        protected var _canvas:Sprite;
        protected var _tween:Tween;
        private static const SLOT_BINDING:String = "TOOLTIP_SLOT";
        private static const ADD_SLOT_BINDING:String = "TOOLTIP_ADD_SLOT";
        private static const ADD_SLOT_COUNT:int = 30;
        private static const TRADE_SLOT_COUNT:int = 10;
        private static const SHOW_DELAY:int = 100;
        static var _allowInstantiation:Boolean;
        static var _instance:TooltipManager;
        public static var _elem:MovieClip;

        public function TooltipManager(param1:Stage) : void
        {
            if (!_allowInstantiation)
            {
                throw new Error("Error: Instantiation failed: Use TooltipManager.getInstance() instead of new.");
            }
            this._hoverMode = true;
            this._canvas = new Sprite();
            this._stage = param1;
            if (this._stage)
            {
                this._stage.addEventListener(TooltipEvent.REGISTER_ELEMENT, this.handleTooltipRegisterEvent, false, 0, true);
                this._stage.addEventListener(TooltipEvent.UNREGISTER_ELEMENT, this.handleTooltipUnregisterEvent, false, 0, true);
                this._stage.addChild(this._canvas);
            }
            return;
        }// end function

        protected function registerElement(param1:UIComponent) : void
        {
            param1.addEventListener(MouseEvent.ROLL_OVER, this.showTooltipDelay, false, 0, true);
            param1.addEventListener(MouseEvent.ROLL_OUT, hideTooltip, false, 0, true);
            return;
        }// end function

        protected function unregisterElement(param1:UIComponent) : void
        {
            param1.removeEventListener(MouseEvent.ROLL_OVER, this.showTooltipDelay, false);
            param1.removeEventListener(MouseEvent.ROLL_OUT, hideTooltip, false);
            return;
        }// end function

        protected function handleTooltipRegisterEvent(event:TooltipEvent) : void
        {
            var _loc_2:* = event.elem as UIComponent;
            if (_loc_2 != null)
            {
                TooltipManager.register(_loc_2);
            }
            return;
        }// end function

        protected function handleTooltipUnregisterEvent(event:TooltipEvent) : void
        {
            var _loc_2:* = event.elem as UIComponent;
            if (_loc_2 != null)
            {
                TooltipManager.unregister(_loc_2);
            }
            return;
        }// end function

        protected function showTooltipDelay(event:MouseEvent) : void
        {
            if (this._tween != null)
            {
                Tween.removeTween(this._tween);
                this._tween = null;
            }
            var _loc_2:* = new Object();
            _loc_2.onComplete = this.showTooltip;
            this._tween = new Tween(SHOW_DELAY, event.target, null, _loc_2);
            this._tween.data = new Object();
            this._tween.data.e = event;
            return;
        }// end function

        protected function showTooltip(param1:Tween) : void
        {
            var _loc_2:* = param1.data.e;
            _elem = _loc_2.target as MovieClip;
            var _loc_3:* = _elem.tooltip;
            if (_loc_3 == null)
            {
                return;
            }
            if (this._tooltipUnit == null)
            {
                this._tooltipUnit = new BasicTooltip();
            }
            this._tooltipUnit.showTooltip(_loc_2, this._canvas, this._stage, _loc_3);
            return;
        }// end function

        protected function showTooltipImpl() : void
        {
            return;
        }// end function

        protected function resetHoverMode() : void
        {
            if (this._resetTimerID)
            {
                clearInterval(this._resetTimerID);
                this._resetTimerID = undefined;
            }
            this._hoverMode = false;
            return;
        }// end function

        protected function setupTooltipLocation(param1:Number, param2:Number, param3:Point, param4:Point) : void
        {
            var _loc_5:* = 0;
            var _loc_6:* = 0;
            _loc_5 = param3.x - param1;
            if (_loc_5 < 0)
            {
                _loc_5 = param4.x;
            }
            _loc_6 = param3.y - param2;
            if (_loc_6 < 0)
            {
                _loc_6 = param4.y;
            }
            if (this._stage.stageHeight < _loc_6 + param2)
            {
                _loc_6 = this._stage.stageHeight - param2;
            }
            this._tooltipRef.x = _loc_5;
            this._tooltipRef.y = _loc_6;
            return;
        }// end function

        public static function init(param1:Stage) : TooltipManager
        {
            if (_instance == null)
            {
                _allowInstantiation = true;
                _instance = new TooltipManager(param1);
                _allowInstantiation = false;
            }
            return _instance;
        }// end function

        public static function isInitialized() : Boolean
        {
            return _instance != null;
        }// end function

        public static function register(param1:UIComponent) : void
        {
            _instance.registerElement(param1);
            return;
        }// end function

        public static function unregister(param1:UIComponent) : void
        {
            _instance.unregisterElement(param1);
            return;
        }// end function

        public static function GetTooltipRef() : MovieClip
        {
            if (_instance != null && _instance._tooltipUnit != null && _instance._tooltipUnit.tooltipRef != null)
            {
                return _instance._tooltipUnit.tooltipRef;
            }
            return null;
        }// end function

        public static function hideTooltip(param1:Object) : void
        {
            if (_instance._tween != null)
            {
                Tween.removeTween(_instance._tween);
                _instance._tween = null;
            }
            if (_instance._tooltipUnit)
            {
                _instance._tooltipUnit.HideTooltip(_instance._canvas);
                if (DataAdapter.hideTooltipSlot != null)
                {
                    DataAdapter.hideTooltipSlot();
                }
            }
            if (_instance._tooltipRef)
            {
                _instance._canvas.removeChild(_instance._tooltipRef);
                _instance._tooltipRef = null;
                if (DataAdapter.hideTooltipSlot != null)
                {
                    DataAdapter.hideTooltipSlot();
                }
            }
            return;
        }// end function

        public static function IsOpenTooltip() : Boolean
        {
            return _instance._tooltipRef == null ? (false) : (true);
        }// end function

    }
}
