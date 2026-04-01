package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.system.*;
    import ran.ui.*;

    public class MDisplayMan extends MovieClip
    {
        public const LAYER_BOTTOM:int = 0;
        public const LAYER_MIDDLE:int = 1;
        public const LAYER_TOP:int = 2;
        public const LAYER_ITEM:int = 3;
        public var layerB:MovieClip;
        public var layerM:MovieClip;
        public var layerT:MovieClip;
        public var layerItem:MovieClip;
        protected var arrItem:Array;
        protected const itemNameW:Number = 250;
        protected const itemNameH:Number = 17;
        protected const boundStartX:Number = 100;
        protected const boundStartY:Number = 100;
        protected const boundOffsetX:Number = 150;
        protected const boundOffsetY:Number = 117;
        protected const maxOverlapCount:int = 10;
        protected const overlapOffsetX:Number = 10;
        protected const overlapOffsetY:Number = 5;
        protected var boundColCount:int = 0;
        protected var arrBoundary:Array;

        public function MDisplayMan()
        {
            this.layerItem = new MovieClip();
            addChild(this.layerItem);
            this.layerB = new MovieClip();
            addChild(this.layerB);
            this.layerM = new MovieClip();
            addChild(this.layerM);
            this.layerT = new MovieClip();
            addChild(this.layerT);
            this.arrItem = new Array();
            addEventListener(Event.ENTER_FRAME, this.onInit, false, 0, true);
            return;
        }// end function

        protected function onInit(event:Event) : void
        {
            removeEventListener(Event.ENTER_FRAME, this.onInit);
            var _loc_2:* = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null)
            {
                _loc_2 = loaderInfo.applicationDomain;
            }
            MDamageDisplay.domain = _loc_2;
            this.ResetSortBoundary();
            if (DataAdapter.registerDisplayInterface != null)
            {
                DataAdapter.registerDisplayInterface(this.AddDisplay, this.ChangeLayer, this.SetDamage, this.SortItemLayer);
            }
            return;
        }// end function

        protected function SetLayer(param1:int, param2:MovieClip) : void
        {
            if (param1 == this.LAYER_BOTTOM)
            {
                this.layerB.addChild(param2);
            }
            else if (param1 == this.LAYER_MIDDLE)
            {
                this.layerM.addChild(param2);
            }
            else if (param1 == this.LAYER_TOP)
            {
                this.layerT.addChild(param2);
            }
            else if (param1 == this.LAYER_ITEM)
            {
                this.layerItem.addChild(param2);
                if (this.arrItem.indexOf(param2) == -1)
                {
                    this.arrItem.push(param2);
                }
            }
            return;
        }// end function

        public function AddDisplay(param1:int, param2:String) : MovieClip
        {
            var _loc_3:* = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null)
            {
                _loc_3 = loaderInfo.applicationDomain;
            }
            var _loc_4:* = _loc_3.getDefinition(param2) as Class;
            if (_loc_3.getDefinition(param2) as Class == null)
            {
                return null;
            }
            var _loc_5:* = new _loc_4 as MovieClip;
            this.SetLayer(param1, _loc_5);
            return _loc_5;
        }// end function

        public function ChangeLayer(param1:int, param2:MovieClip) : void
        {
            this.layerB.removeChild(param2);
            this.layerM.removeChild(param2);
            this.layerT.removeChild(param2);
            this.layerItem.removeChild(param2);
            this.SetLayer(param1, param2);
            return;
        }// end function

        public function SetDamage(param1:MovieClip, param2:uint, param3:Boolean, param4:Boolean, param5:Boolean) : void
        {
            var _loc_6:* = param1 as MDamageDisplay;
            if (_loc_6 == null)
            {
                return;
            }
            _loc_6.SetDamage(param2, param3, param4, param5);
            return;
        }// end function

        public function ResetSortBoundary() : void
        {
            var _loc_4:* = NaN;
            var _loc_5:* = 0;
            var _loc_6:* = NaN;
            var _loc_7:* = null;
            var _loc_8:* = 0;
            var _loc_9:* = null;
            this.arrBoundary = [];
            var _loc_1:* = stage.stageWidth - this.boundOffsetX;
            var _loc_2:* = stage.stageHeight - this.boundOffsetY;
            var _loc_3:* = 0;
            while (true)
            {
                
                _loc_4 = _loc_3 * this.boundOffsetX + this.boundStartX;
                if (_loc_4 > _loc_1)
                {
                    break;
                }
                this.boundColCount = 0;
                _loc_5 = 0;
                while (true)
                {
                    
                    _loc_6 = _loc_5 * this.itemNameH + this.boundStartY;
                    if (_loc_6 > _loc_2)
                    {
                        break;
                    }
                    _loc_5++;
                    var _loc_10:* = this;
                    var _loc_11:* = this.boundColCount + 1;
                    _loc_10.boundColCount = _loc_11;
                    _loc_7 = new Array();
                    _loc_8 = 0;
                    while (_loc_8 < this.maxOverlapCount)
                    {
                        
                        _loc_7.push(false);
                        _loc_8++;
                    }
                    _loc_9 = new Object();
                    _loc_9.pt = new Point(_loc_4, _loc_6);
                    _loc_9.used = _loc_7;
                    this.arrBoundary.push(_loc_9);
                }
                _loc_3++;
            }
            return;
        }// end function

        public function SortItemLayer() : void
        {
            var _loc_3:* = null;
            var _loc_4:* = false;
            var _loc_5:* = NaN;
            var _loc_6:* = NaN;
            var _loc_7:* = 0;
            var _loc_8:* = 0;
            var _loc_9:* = 0;
            var _loc_10:* = 0;
            var _loc_11:* = 0;
            var _loc_12:* = 0;
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            _loc_1 = 0;
            while (_loc_1 < this.arrBoundary.length)
            {
                
                _loc_2 = 0;
                while (_loc_2 < this.maxOverlapCount)
                {
                    
                    this.arrBoundary[_loc_1].used[_loc_2] = false;
                    _loc_2++;
                }
                _loc_1++;
            }
            _loc_1 = 0;
            while (_loc_1 < this.arrItem.length)
            {
                
                _loc_3 = this.arrItem[_loc_1] as MItemNameDisplay;
                if (_loc_3.visible == false || _loc_3.enabledClick == false)
                {
                }
                else
                {
                    _loc_4 = false;
                    _loc_5 = _loc_3.origX < 0 ? (0) : (_loc_3.origX);
                    _loc_6 = _loc_3.origY - this.boundOffsetY < 0 ? (0) : (_loc_3.origY - this.boundOffsetY);
                    _loc_7 = Math.floor(_loc_5 / this.boundOffsetX) * this.boundColCount;
                    _loc_8 = _loc_7 + this.boundColCount - 1;
                    _loc_9 = _loc_7 + Math.floor(_loc_6 / this.itemNameH);
                    if (_loc_9 < _loc_7)
                    {
                        _loc_9 = _loc_7;
                    }
                    if (_loc_9 > _loc_8)
                    {
                        _loc_9 = _loc_8;
                    }
                    _loc_10 = 0;
                    while (_loc_10 < this.maxOverlapCount)
                    {
                        
                        _loc_11 = _loc_10 * this.overlapOffsetX;
                        _loc_12 = _loc_10 * this.overlapOffsetY;
                        _loc_2 = _loc_9;
                        while (_loc_2 < this.arrBoundary.length && _loc_2 > _loc_7)
                        {
                            
                            if (this.arrBoundary[_loc_2].used[_loc_10] == true)
                            {
                            }
                            else
                            {
                                _loc_3.x = this.arrBoundary[_loc_2].pt.x + _loc_11;
                                _loc_3.y = this.arrBoundary[_loc_2].pt.y + _loc_12;
                                this.arrBoundary[_loc_2].used[_loc_10] = true;
                                _loc_4 = true;
                                break;
                            }
                            _loc_2 = _loc_2 - 1;
                        }
                        if (_loc_4 == true)
                        {
                            break;
                        }
                        _loc_2 = _loc_9;
                        while (_loc_2 < this.arrBoundary.length && _loc_2 < _loc_8)
                        {
                            
                            if (this.arrBoundary[_loc_2].used[_loc_10] == true)
                            {
                            }
                            else
                            {
                                _loc_3.x = this.arrBoundary[_loc_2].pt.x + _loc_11;
                                _loc_3.y = this.arrBoundary[_loc_2].pt.y + _loc_12;
                                this.arrBoundary[_loc_2].used[_loc_10] = true;
                                _loc_4 = true;
                                break;
                            }
                            _loc_2++;
                        }
                        if (_loc_4 == true)
                        {
                            break;
                        }
                        _loc_10++;
                    }
                }
                _loc_1++;
            }
            return;
        }// end function

    }
}
