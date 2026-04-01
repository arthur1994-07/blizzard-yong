package ran.ui.core
{
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.text.*;
    import flash.utils.*;
    import scaleform.clik.core.*;
    import scaleform.clik.motion.*;

    public class MDisplay extends UIComponent
    {
        private var mapLayer:Dictionary;
        private var arrDisableList:Array;

        public function MDisplay()
        {
            this.mapLayer = new Dictionary();
            this.arrDisableList = [];
            return;
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            mouseEnabled = false;
            return;
        }// end function

        private function FindDisplay(param1:String, param2:String) : MDisplayObj
        {
            var _loc_3:* = this.mapLayer[param1] as MovieClip;
            if (_loc_3 == null)
            {
                return null;
            }
            return _loc_3.getChildByName(param2) as MDisplayObj;
        }// end function

        private function PopDisableDisplay(param1:String) : MDisplayObj
        {
            var _loc_2:* = 0;
            while (_loc_2 < this.arrDisableList.length)
            {
                
                if (param1 == this.arrDisableList[_loc_2].className)
                {
                    return this.arrDisableList[_loc_2] as MDisplayObj;
                }
                _loc_2++;
            }
            return null;
        }// end function

        public function AddLayer(param1:String) : void
        {
            var _loc_2:* = this.mapLayer[param1];
            if (_loc_2 != null)
            {
                return;
            }
            var _loc_3:* = new MovieClip();
            addChild(_loc_3);
            this.mapLayer[param1] = _loc_3;
            return;
        }// end function

        public function AddDisplay(param1:String, param2:String, param3:String) : void
        {
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_4:* = this.mapLayer[param1] as MovieClip;
            if (_loc_4 == null)
            {
                return;
            }
            var _loc_5:* = this.PopDisableDisplay(param3);
            if (_loc_5 == null)
            {
                _loc_6 = getDefinitionByName(param3) as Class;
                if (_loc_6 == null)
                {
                    return;
                }
                _loc_7 = new _loc_6 as MovieClip;
                _loc_5 = new MDisplayObj();
                _loc_5.className = param3;
                _loc_5.SetMC(_loc_7);
            }
            _loc_5.name = param2;
            _loc_5.Reset();
            _loc_4.addChild(_loc_5);
            return;
        }// end function

        public function RemoveDisplay(param1:String, param2:String) : void
        {
            var _loc_3:* = this.mapLayer[param1] as MovieClip;
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = _loc_3.getChildByName(param2) as MDisplayObj;
            _loc_3.removeChild(_loc_4);
            this.arrDisableList.push(_loc_4);
            return;
        }// end function

        public function RemoveDisplayTarget(param1:MovieClip, param2:MDisplayObj) : void
        {
            param1.removeChild(param2);
            this.arrDisableList.push(param2);
            return;
        }// end function

        private function FindDisplayInst(param1:MDisplayObj, param2:String) : Object
        {
            var _loc_3:* = null;
            var _loc_4:* = "";
            var _loc_5:* = 0;
            while (_loc_5 < param2.length)
            {
                
                if (param2.charAt(_loc_5) == ".")
                {
                    if (_loc_3 == null)
                    {
                        _loc_3 = param1.mc[_loc_4];
                    }
                    else
                    {
                        _loc_3 = _loc_3[_loc_4];
                    }
                    _loc_4 = "";
                }
                else
                {
                    _loc_4 = _loc_4 + param2.charAt(_loc_5);
                }
                _loc_5++;
            }
            if (_loc_4.length != 0)
            {
                if (_loc_3 == null)
                {
                    _loc_3 = param1.mc[_loc_4];
                }
                else
                {
                    _loc_3 = _loc_3[_loc_4];
                }
            }
            return _loc_3;
        }// end function

        public function SetDisplayProp(param1:String, param2:String, param3:String, param4:String, param5:String) : void
        {
            var _loc_6:* = this.FindDisplay(param1, param2);
            if (_loc_6 == null)
            {
                return;
            }
            var _loc_7:* = this.FindDisplayInst(_loc_6, param3);
            if (_loc_7 == null)
            {
                return;
            }
            _loc_7[param4] = param5;
            return;
        }// end function

        public function SetDisplayTextColor(param1:String, param2:String, param3:String, param4:uint) : void
        {
            var _loc_5:* = this.FindDisplay(param1, param2);
            if (_loc_5 == null)
            {
                return;
            }
            var _loc_6:* = this.FindDisplayInst(_loc_5, param3);
            if (_loc_6 == null)
            {
                return;
            }
            _loc_6.updateText();
            var _loc_7:* = new TextFormat();
            _loc_7.color = param4;
            _loc_6.textField.setTextFormat(_loc_7, 0, _loc_6.text.length);
            return;
        }// end function

        public function SetIcon(param1:String, param2:String, param3:String, param4:String) : void
        {
            var _loc_5:* = this.FindDisplay(param1, param2);
            if (_loc_5 == null)
            {
                return;
            }
            var _loc_6:* = this.FindDisplayInst(_loc_5, param3);
            if (_loc_6 == null)
            {
                return;
            }
            _loc_5.LoadIcon(param4, _loc_6 as MovieClip);
            return;
        }// end function

        public function SetDamage(param1:String, param2:String, param3:String, param4:uint, param5:String) : void
        {
            var _loc_6:* = this.FindDisplay(param1, param2);
            if (_loc_6 == null)
            {
                return;
            }
            var _loc_7:* = this.FindDisplayInst(_loc_6, param3);
            if (_loc_7 == null)
            {
                return;
            }
            _loc_6.SetDamage(_loc_7 as MovieClip, param4, param5);
            return;
        }// end function

        public function SetChat(param1:String, param2:String, param3:String, param4:String, param5:String, param6:uint, param7:String, param8:uint) : void
        {
            var _loc_9:* = this.FindDisplay(param1, param2);
            if (_loc_9 == null)
            {
                return;
            }
            var _loc_10:* = this.FindDisplayInst(_loc_9, param3);
            if (_loc_10 == null)
            {
                return;
            }
            _loc_10.text = param5 + "\n" + param7;
            _loc_10.updateText();
            _loc_10.height = _loc_10.textField.numLines * 18;
            var _loc_11:* = this.FindDisplayInst(_loc_9, param4);
            if (_loc_11 != null)
            {
                _loc_11.height = _loc_10.height + 10;
            }
            var _loc_12:* = new TextFormat();
            _loc_12.color = param6;
            _loc_10.textField.setTextFormat(_loc_12, 0, param5.length);
            _loc_12 = new TextFormat();
            _loc_12.color = param8;
            _loc_10.textField.setTextFormat(_loc_12, (param5.length + 1), param7.length);
            return;
        }// end function

        public function SetPosition(param1:String, param2:String, param3:int, param4:int) : void
        {
            var _loc_5:* = this.FindDisplay(param1, param2);
            _loc_5.x = param3;
            _loc_5.y = param4;
            return;
        }// end function

        public function SetInstancePosition(param1:String, param2:String, param3:String, param4:int, param5:int) : void
        {
            var _loc_6:* = this.FindDisplay(param1, param2);
            _loc_6.mc[param3].x = param4;
            _loc_6.mc[param3].y = param5;
            return;
        }// end function

        public function SetScale(param1:String, param2:String, param3:Number) : void
        {
            var _loc_4:* = this.FindDisplay(param1, param2);
            _loc_4.scaleX = param3;
            _loc_4.scaleY = param3;
            return;
        }// end function

        public function SetLifeTime(param1:String, param2:String, param3:Number, param4:Number) : void
        {
            var _loc_5:* = this.mapLayer[param1] as MovieClip;
            if (_loc_5 == null)
            {
                return;
            }
            var _loc_6:* = new Object();
            _loc_6.layer = _loc_5;
            _loc_6.time = param4;
            var _loc_7:* = _loc_5.getChildByName(param2) as MDisplayObj;
            var _loc_8:* = new Tween(param3, _loc_7, {}, {data:_loc_6, onComplete:this.handleLifeTimeComplete});
            return;
        }// end function

        private function handleLifeTimeComplete(param1:Tween) : void
        {
            var _loc_2:* = new Tween(param1.data.time, param1.target, {alpha:0}, {ease:Strong.easeOut, data:param1.data.layer, onComplete:this.handleInvisibleAnim});
            return;
        }// end function

        private function handleInvisibleAnim(param1:Tween) : void
        {
            this.RemoveDisplayTarget(param1.data as MovieClip, param1.target as MDisplayObj);
            return;
        }// end function

    }
}
