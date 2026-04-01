package ran.ui.managers
{
    import flash.display.*;

    public class ModalManager extends Object
    {
        private static var _stage:Stage;
        private static var _init:Boolean = false;
        private static var canvasModal_b:MovieClip;
        private static var canvasModal_m:MovieClip;
        private static var canvasModal_t:MovieClip;
        private static const colorBG:uint = 0;
        private static const alphaBG:Number = 0;

        public function ModalManager()
        {
            return;
        }// end function

        public static function Init(param1:Stage) : void
        {
            _stage = param1;
            canvasModal_b = new MovieClip();
            canvasModal_b.visible = false;
            canvasModal_b.graphics.beginFill(colorBG, alphaBG);
            canvasModal_b.graphics.drawRect(0, 0, _stage.stageWidth, _stage.stageHeight);
            canvasModal_b.graphics.endFill();
            _stage.addChild(canvasModal_b);
            canvasModal_m = new MovieClip();
            canvasModal_m.visible = false;
            canvasModal_m.graphics.beginFill(colorBG, alphaBG);
            canvasModal_m.graphics.drawRect(0, 0, _stage.stageWidth, _stage.stageHeight);
            canvasModal_m.graphics.endFill();
            _stage.addChild(canvasModal_m);
            canvasModal_t = new MovieClip();
            canvasModal_t.visible = false;
            canvasModal_t.graphics.beginFill(colorBG, alphaBG);
            canvasModal_t.graphics.drawRect(0, 0, _stage.stageWidth, _stage.stageHeight);
            canvasModal_t.graphics.endFill();
            _stage.addChild(canvasModal_t);
            _init = true;
            return;
        }// end function

        public static function Resolution(param1:int, param2:int) : void
        {
            if (_init == false)
            {
                return;
            }
            canvasModal_b.graphics.beginFill(colorBG, alphaBG);
            canvasModal_b.graphics.drawRect(0, 0, _stage.stageWidth, _stage.stageHeight);
            canvasModal_b.graphics.endFill();
            canvasModal_m.graphics.beginFill(colorBG, alphaBG);
            canvasModal_m.graphics.drawRect(0, 0, _stage.stageWidth, _stage.stageHeight);
            canvasModal_m.graphics.endFill();
            canvasModal_t.graphics.beginFill(colorBG, alphaBG);
            canvasModal_t.graphics.drawRect(0, 0, _stage.stageWidth, _stage.stageHeight);
            canvasModal_t.graphics.endFill();
            return;
        }// end function

        public static function AddChild(param1:DisplayObject, param2:int) : void
        {
            if (_init == false)
            {
                return;
            }
            if (param2 == 2)
            {
                canvasModal_t.addChild(param1);
                canvasModal_t.visible = true;
            }
            else if (param2 == 1)
            {
                canvasModal_m.addChild(param1);
                canvasModal_m.visible = true;
            }
            else
            {
                canvasModal_b.addChild(param1);
                canvasModal_b.visible = true;
            }
            return;
        }// end function

        public static function RemoveChild(param1:DisplayObject, param2) : void
        {
            if (_init == false)
            {
                return;
            }
            if (param2 == 2)
            {
                canvasModal_t.removeChild(param1);
                if (canvasModal_t.numChildren <= 0)
                {
                    canvasModal_t.visible = false;
                }
            }
            else if (param2 == 1)
            {
                canvasModal_m.removeChild(param1);
                if (canvasModal_m.numChildren <= 0)
                {
                    canvasModal_m.visible = false;
                }
            }
            else
            {
                canvasModal_b.removeChild(param1);
                if (canvasModal_b.numChildren <= 0)
                {
                    canvasModal_b.visible = false;
                }
            }
            TryToReleseFocus();
            return;
        }// end function

        public static function VisibleChild(param1:Boolean, param2:int) : void
        {
            var _loc_5:* = 0;
            if (_init == false)
            {
                return;
            }
            var _loc_3:* = null;
            if (param2 == 2)
            {
                _loc_3 = canvasModal_t;
            }
            else if (param2 == 1)
            {
                _loc_3 = canvasModal_m;
            }
            else
            {
                _loc_3 = canvasModal_b;
            }
            var _loc_4:* = false;
            if (param1 == false)
            {
                _loc_5 = 0;
                while (_loc_5 < _loc_3.numChildren)
                {
                    
                    if (_loc_3.getChildAt(_loc_5).visible == true)
                    {
                        _loc_4 = true;
                        break;
                    }
                    _loc_5++;
                }
            }
            else
            {
                _loc_4 = true;
            }
            _loc_3.visible = _loc_4;
            if (!_loc_4)
            {
                TryToReleseFocus();
            }
            return;
        }// end function

        public static function CheckVisible(param1:int) : void
        {
            var _loc_2:* = null;
            if (param1 == 2)
            {
                _loc_2 = canvasModal_t;
            }
            else if (param1 == 1)
            {
                _loc_2 = canvasModal_m;
            }
            else
            {
                _loc_2 = canvasModal_b;
            }
            var _loc_3:* = false;
            var _loc_4:* = 0;
            while (_loc_4 < _loc_2.numChildren)
            {
                
                if (_loc_2.getChildAt(_loc_4).visible == true)
                {
                    _loc_3 = true;
                    break;
                }
                _loc_4++;
            }
            _loc_2.visible = _loc_3;
            if (!_loc_3)
            {
                TryToReleseFocus();
            }
            return;
        }// end function

        private static function TryToReleseFocus() : void
        {
            if (canvasModal_t.numChildren == 0 && canvasModal_m.numChildren == 0 && canvasModal_b.numChildren == 0)
            {
                _stage.focus = null;
            }
            return;
        }// end function

    }
}
