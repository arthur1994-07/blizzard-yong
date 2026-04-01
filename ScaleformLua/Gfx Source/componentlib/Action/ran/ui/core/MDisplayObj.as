package ran.ui.core
{
    import flash.display.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;

    public class MDisplayObj extends MovieClip
    {
        private var arrChild:Array;
        public var className:String;
        public var mc:MovieClip;

        public function MDisplayObj()
        {
            this.mouseEnabled = false;
            this.arrChild = [];
            return;
        }// end function

        public function SetMC(param1:MovieClip) : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = null;
            this.mc = param1;
            while (_loc_2 < this.mc.numChildren)
            {
                
                _loc_3 = this.mc.getChildAt(_loc_2);
                _loc_3["mouseEnabled"] = false;
                _loc_3["focusable"] = false;
                _loc_2++;
            }
            addChild(this.mc);
            return;
        }// end function

        public function Reset() : void
        {
            this.x = 0;
            this.y = 0;
            this.alpha = 1;
            var _loc_1:* = 0;
            while (_loc_1 < this.arrChild.length)
            {
                
                this.arrChild[_loc_1].removeChildren();
                _loc_1++;
            }
            return;
        }// end function

        public function LoadIcon(param1:String, param2:MovieClip) : void
        {
            param2.removeChildren();
            var _loc_3:* = new URLRequest(param1);
            var _loc_4:* = new LoaderContext(false, null);
            var _loc_5:* = new Loader();
            _loc_5.load(_loc_3, _loc_4);
            param2.addChild(_loc_5);
            this.arrChild.push(param2);
            return;
        }// end function

        public function SetDamage(param1:MovieClip, param2:uint, param3:String) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (param1.numChildren != 0)
            {
                param1.removeChildren();
            }
            var _loc_6:* = null;
            if (param2 == 0)
            {
                _loc_5 = param3 + "miss";
                _loc_6 = getDefinitionByName(_loc_5) as Class;
                if (_loc_6 == null)
                {
                    return;
                }
                _loc_4 = new _loc_6 as MovieClip;
                _loc_4.mouseEnabled = false;
                _loc_4.x = -_loc_4.width / 2;
                _loc_4.y = -_loc_4.height / 2;
                param1.addChild(_loc_4);
                return;
            }
            var _loc_7:* = [];
            var _loc_8:* = param2;
            var _loc_9:* = 0;
            var _loc_10:* = 0;
            while (true)
            {
                
                if (_loc_8 == 0)
                {
                    break;
                }
                _loc_9 = _loc_8 % 10;
                _loc_8 = _loc_8 / 10;
                _loc_5 = param3 + _loc_9;
                _loc_6 = getDefinitionByName(_loc_5) as Class;
                if (_loc_6 == null)
                {
                    continue;
                }
                _loc_4 = new _loc_6 as MovieClip;
                _loc_4.mouseEnabled = false;
                param1.addChild(_loc_4);
                _loc_7.push(_loc_4);
                _loc_10 = _loc_10 + _loc_4.width;
            }
            if (_loc_7.length == 0)
            {
                return;
            }
            var _loc_11:* = _loc_10 / 2;
            var _loc_12:* = 0;
            var _loc_13:* = 0;
            while (_loc_13 < _loc_7.length)
            {
                
                _loc_4 = _loc_7[_loc_13] as MovieClip;
                if (_loc_13 == 0)
                {
                    _loc_4.x = _loc_10 - _loc_4.width - _loc_11;
                }
                else
                {
                    _loc_4.x = _loc_12 - _loc_4.width;
                }
                _loc_4.y = -_loc_4.height / 2;
                _loc_12 = _loc_4.x;
                _loc_13++;
            }
            this.arrChild.push(param1);
            return;
        }// end function

    }
}
