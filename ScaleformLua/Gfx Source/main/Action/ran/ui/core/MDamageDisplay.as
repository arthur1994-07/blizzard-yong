package ran.ui.core
{
    import flash.display.*;
    import flash.system.*;

    public class MDamageDisplay extends MovieClip
    {
        public var mcDmg:MovieClip;
        static const IDX_CRITICAL:int = 10;
        static const IDX_MISS:int = 11;
        static const IDX_STRIKE:int = 12;
        static const IDX_BG:int = 13;
        static const IDX_SIZE:int = 14;
        static var arrBlue:Array;
        static var arrRed:Array;
        public static var domain:ApplicationDomain;

        public function MDamageDisplay()
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            var _loc_4:* = null;
            var _loc_3:* = 0;
            if (arrBlue == null)
            {
                arrBlue = new Array();
                _loc_3 = 0;
                while (_loc_3 < IDX_SIZE)
                {
                    
                    _loc_4 = "Dmg.";
                    if (IDX_CRITICAL == _loc_3)
                    {
                        _loc_4 = _loc_4 + "critical";
                    }
                    else if (IDX_MISS == _loc_3)
                    {
                        _loc_4 = _loc_4 + "miss";
                    }
                    else if (IDX_STRIKE == _loc_3)
                    {
                        _loc_4 = _loc_4 + "strike";
                    }
                    else if (IDX_BG == _loc_3)
                    {
                        _loc_4 = _loc_4 + "background";
                    }
                    else
                    {
                        _loc_4 = _loc_4 + _loc_3;
                    }
                    _loc_1 = domain.getDefinition(_loc_4) as Class;
                    if (_loc_1 == null)
                    {
                        return;
                    }
                    _loc_2 = new _loc_1 as MovieClip;
                    arrBlue.push(_loc_2);
                    _loc_3++;
                }
            }
            if (arrRed == null)
            {
                arrRed = new Array();
                _loc_3 = 0;
                while (_loc_3 < IDX_SIZE)
                {
                    
                    _loc_4 = "Dmg.red.";
                    if (IDX_CRITICAL == _loc_3)
                    {
                        _loc_4 = _loc_4 + "critical";
                    }
                    else if (IDX_MISS == _loc_3)
                    {
                        _loc_4 = _loc_4 + "miss";
                    }
                    else if (IDX_STRIKE == _loc_3)
                    {
                        _loc_4 = _loc_4 + "strike";
                    }
                    else if (IDX_BG == _loc_3)
                    {
                        _loc_4 = _loc_4 + "background";
                    }
                    else
                    {
                        _loc_4 = _loc_4 + _loc_3;
                    }
                    _loc_1 = domain.getDefinition(_loc_4) as Class;
                    if (_loc_1 == null)
                    {
                        return;
                    }
                    _loc_2 = new _loc_1 as MovieClip;
                    arrRed.push(_loc_2);
                    _loc_3++;
                }
            }
            return;
        }// end function

        protected function Copy(param1:int, param2:Boolean) : MovieClip
        {
            var _loc_3:* = null;
            if (param2 == true)
            {
                _loc_3 = arrRed;
            }
            else
            {
                _loc_3 = arrBlue;
            }
            var _loc_4:* = _loc_3[param1];
            var _loc_5:* = Object(_loc_4).constructor;
            var _loc_6:* = new Object(_loc_4).constructor as MovieClip;
            (_loc_6).transform = _loc_4.transform;
            _loc_6.filters = _loc_4.filters;
            _loc_6.cacheAsBitmap = _loc_4.cacheAsBitmap;
            return _loc_6;
        }// end function

        public function SetDamage(param1:uint, param2:Boolean, param3:Boolean, param4:Boolean)
        {
            var _loc_5:* = null;
            var _loc_21:* = null;
            while (this.mcDmg.numChildren != 0)
            {
                
                this.mcDmg.removeChildAt(0);
            }
            if (this.parent != null)
            {
                _loc_21 = this.parent as MovieClip;
                _loc_21.removeChild(this);
                _loc_21.addChild(this);
            }
            if (param1 == 0)
            {
                _loc_5 = this.Copy(IDX_MISS, param4);
                this.mcDmg.addChild(_loc_5);
                this.gotoAndPlay(1);
                this.visible = true;
                return;
            }
            var _loc_6:* = [];
            var _loc_7:* = param1;
            var _loc_8:* = 0;
            var _loc_9:* = 0;
            var _loc_10:* = 0;
            var _loc_11:* = 0;
            var _loc_12:* = null;
            var _loc_13:* = false;
            var _loc_14:* = this.Copy(IDX_BG, param4);
            this.mcDmg.addChild(_loc_14);
            if (param2 == true)
            {
                _loc_12 = this.Copy(IDX_CRITICAL, param4);
                _loc_13 = true;
            }
            else if (param3 == true)
            {
                _loc_12 = this.Copy(IDX_STRIKE, param4);
                _loc_13 = true;
            }
            if (_loc_13 == true)
            {
                this.mcDmg.addChild(_loc_12);
                _loc_9 = _loc_9 + _loc_12.width;
            }
            while (true)
            {
                
                if (_loc_7 == 0)
                {
                    break;
                }
                _loc_8 = _loc_7 % 10;
                _loc_7 = _loc_7 / 10;
                _loc_5 = this.Copy(_loc_8, param4);
                this.mcDmg.addChild(_loc_5);
                _loc_6.push(_loc_5);
                _loc_9 = _loc_9 + _loc_5.width;
                _loc_10 = _loc_10 + _loc_5.width;
                if (_loc_11 < _loc_5.height)
                {
                    _loc_11 = _loc_5.height;
                }
            }
            if (_loc_6.length == 0)
            {
                return;
            }
            var _loc_15:* = _loc_9 / 2;
            var _loc_16:* = 0;
            if (_loc_12 != null)
            {
                _loc_12.x = _loc_15 * -1;
                _loc_12.y = _loc_12.height / 2 * -1;
            }
            var _loc_17:* = _loc_6.length;
            var _loc_18:* = 0;
            while (_loc_18 < _loc_17)
            {
                
                _loc_5 = _loc_6[_loc_18];
                if (_loc_18 == 0)
                {
                    _loc_5.x = _loc_9 - _loc_5.width - _loc_15;
                }
                else
                {
                    _loc_5.x = _loc_16 - _loc_5.width;
                }
                _loc_5.y = -_loc_5.height / 2;
                _loc_16 = _loc_5.x;
                _loc_18++;
            }
            var _loc_19:* = 0;
            var _loc_20:* = 0;
            if (_loc_14.scale9Grid != null)
            {
                _loc_19 = _loc_14.scale9Grid.left;
                _loc_20 = _loc_14.scale9Grid.top;
                _loc_10 = _loc_10 + (_loc_14.scale9Grid.left + (_loc_14.width - _loc_14.scale9Grid.right));
                _loc_11 = _loc_11 + (_loc_14.scale9Grid.top + (_loc_14.height - _loc_14.scale9Grid.bottom));
            }
            _loc_14.width = _loc_10;
            _loc_14.height = _loc_11;
            _loc_14.x = _loc_5.x - _loc_19;
            _loc_14.y = _loc_5.y - _loc_20;
            this.gotoAndPlay(1);
            this.visible = true;
            return;
        }// end function

    }
}
