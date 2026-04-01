package IME_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import scaleform.gfx.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var Repositioned:Boolean;
        public var candidateList:Object;
        public var inputWindow_mc:MovieClip;
        public var list_mc:MovieClip;
        public var isCandListOpen:Boolean;
        public var isListCreated:Boolean;
        public var candListHeight:Number;
        public var readingWindowTextColor:uint;
        public var readingWindowBckgndColor:uint;
        public var readingWindowFontSize:uint;
        public var inputWindowHeight:uint;
        public var candListx:uint;
        public var candListy1:uint;
        public var candListy2:uint;
        public var playerWindowH:Object;
        public var playerWindowW:Object;
        public var SendLangBarMessage:Object;

        public function MainTimeline()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        public function IsCandidateList() : Boolean
        {
            return true;
        }// end function

        public function InitReadingWindowDefaults(param1:IMECandidateListStyle) : void
        {
            readingWindowTextColor = param1.readingWindowTextColor == 0 ? (0) : (param1.readingWindowTextColor);
            readingWindowBckgndColor = param1.readingWindowBackgroundColor == 0 ? (15725300) : (param1.readingWindowBackgroundColor);
            readingWindowFontSize = param1.readingWindowFontSize == 0 ? (20) : (param1.readingWindowFontSize);
            return;
        }// end function

        public function DisplayCallback(param1:Number)
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = NaN;
            var _loc_8:* = undefined;
            var _loc_2:* = 0;
            var _loc_6:* = 0;
            while (_loc_6 < candidateList.DisplayItemIndex)
            {
                
                _loc_4 = candidateList.GetItemAtIndex(_loc_6);
                if (_loc_4 != null)
                {
                    _loc_3 = _loc_4.ItemObj;
                    _loc_3.Value.x = _loc_3.ID.x + _loc_3.ID.width;
                    _loc_5 = _loc_3.Value.x + _loc_3.Value.width - _loc_3.bkGround_mc.x + 10;
                    if (_loc_2 < _loc_5)
                    {
                        _loc_2 = _loc_5;
                    }
                    _loc_8 = _loc_3.Value;
                    if (_loc_8.text == "")
                    {
                        _loc_3.ID.alpha = 25;
                    }
                    else
                    {
                        _loc_3.ID.alpha = 100;
                    }
                }
                _loc_6 = _loc_6 + 1;
            }
            var _loc_7:* = candidateList.GetItemAtIndex(0).ItemObj.y;
            candListHeight = 0;
            _loc_6 = 0;
            while (_loc_6 < candidateList.DisplayItemIndex)
            {
                
                _loc_4 = candidateList.GetItemAtIndex(_loc_6);
                if (_loc_4 != null)
                {
                    _loc_3 = _loc_4.ItemObj;
                    _loc_3.bkGround_mc.width = _loc_2;
                    _loc_3.bkGround_mc.height = _loc_8.height;
                    _loc_3.RowNumberBackground_mc.width = _loc_3.ID.width;
                    _loc_3.RowNumberBackground_mc.height = _loc_8.height;
                    candListHeight = candListHeight + _loc_8.height;
                    _loc_3.y = _loc_7;
                    _loc_8.y = 0;
                    _loc_3.ID.y = 0;
                    _loc_3.RowNumberBackground_mc.y = 0;
                    _loc_3.bkGround_mc.y = 0;
                    _loc_7 = _loc_7 + (_loc_3.height - 2);
                }
                _loc_6 = _loc_6 + 1;
            }
            isCandListOpen = true;
            return;
        }// end function

        public function ChangeFont(param1:Number) : void
        {
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            var _loc_5:* = null;
            var _loc_2:* = 0;
            while (_loc_2 < candidateList.DisplayItemIndex)
            {
                
                _loc_3 = candidateList.GetItemAtIndex(_loc_2);
                if (_loc_3 != undefined)
                {
                    _loc_4 = _loc_3.ItemObj;
                    _loc_5 = new TextFormat();
                    _loc_5.size = param1;
                    _loc_4.Value.setNewTextFormat(_loc_5);
                    _loc_4.ID.setNewTextFormat(_loc_5);
                }
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        public function SetCandidateListProps(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number)
        {
            candidateList.SetCandidateListProps(param1, param2, param3, param4, param5, param6, param7);
            return;
        }// end function

        public function SetReadingWindowProps(param1:Number, param2:Number, param3:Number)
        {
            readingWindowTextColor = param1 >= 0 ? (param1) : (readingWindowTextColor);
            readingWindowBckgndColor = param2 >= 0 ? (param2) : (param1);
            readingWindowFontSize = param3 >= 0 ? (param3) : (readingWindowFontSize);
            return;
        }// end function

        public function CreateList(param1:Number, param2:Number)
        {
            var _loc_5:* = null;
            RemoveList();
            isListCreated = true;
            Repositioned = false;
            var _loc_3:* = IMEEx.getIMECandidateListStyle();
            InitReadingWindowDefaults(_loc_3);
            list_mc = new MovieClip();
            list_mc.visible = false;
            MovieClip(this).addChild(list_mc);
            candidateList.CreateCandidateList(list_mc, param1, "Character", 0, 0, "ListRow", new Array("Value"), _loc_3);
            var _loc_4:* = 0;
            while (_loc_4 < param1)
            {
                
                _loc_5 = MovieClip(list_mc.getChildByName("Character" + _loc_4));
                _loc_5.ID.text = (_loc_4 + param2) % 10;
                _loc_5.Value.autoSize = "left";
                _loc_4 = _loc_4 + 1;
            }
            list_mc.tabEnabled = false;
            list_mc.tabChildren = false;
            return;
        }// end function

        public function MakeVisible()
        {
            list_mc.visible = true;
            return;
        }// end function

        public function MakeInvisible()
        {
            if (list_mc != null)
            {
                list_mc.visible = false;
            }
            return;
        }// end function

        public function RepositionWindow(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Boolean
        {
            list_mc.x = param1;
            if (candListHeight < param6 - (param2 + param3))
            {
                list_mc.y = param2 + 5 + param3;
                MakeVisible();
                return false;
            }
            if (param6 - param2 > param4)
            {
                list_mc.y = param2 + 5 + param3;
                MakeVisible();
                return false;
            }
            list_mc.y = param4 - candListHeight - 5;
            MakeVisible();
            return true;
        }// end function

        public function RepositionInputWindow(param1:Number, param2:Number) : void
        {
            if (inputWindow_mc == null)
            {
                return;
            }
            inputWindow_mc.x = param1;
            inputWindow_mc.y = param2;
            return;
        }// end function

        public function DisplayInputWindow(param1:String, param2:Number, param3:Number, param4:uint) : void
        {
            var _loc_7:* = NaN;
            if (param1 == "" && inputWindow_mc == null)
            {
                return;
            }
            if (param1 == "" && inputWindow_mc != null)
            {
                MovieClip(this).removeChild(inputWindow_mc);
                return;
            }
            inputWindow_mc = new InputWindow_mc();
            MovieClip(this).addChild(inputWindow_mc);
            inputWindow_mc.readingWindowTextFld.autoSize = "left";
            inputWindow_mc.readingWindowTextFld.text = param1;
            var _loc_5:* = inputWindow_mc.readingWindowTextFld.getTextFormat();
            var _loc_6:* = IMEEx.getIMECandidateListStyle();
            InitReadingWindowDefaults(_loc_6);
            if (readingWindowTextColor >= 0)
            {
                _loc_5.color = Number(readingWindowTextColor);
            }
            if (readingWindowFontSize >= 0)
            {
                _loc_5.size = readingWindowFontSize;
            }
            if (readingWindowBckgndColor >= 0)
            {
                _loc_7 = Number(readingWindowBckgndColor);
                inputWindow_mc.inputWindowBackground_mc.transform.colorTransform = new ColorTransform(0, 0, 0, 1, (_loc_7 & 16711680) >> 16, (_loc_7 & 65280) >> 8, _loc_7 & 255, 0);
            }
            inputWindow_mc.readingWindowTextFld.setTextFormat(_loc_5);
            inputWindow_mc.inputWindowBackground_mc.width = inputWindow_mc.readingWindowTextFld.width;
            inputWindow_mc.inputWindowBackground_mc.height = inputWindow_mc.readingWindowTextFld.height;
            inputWindow_mc.x = param2;
            inputWindow_mc.y = param3;
            return;
        }// end function

        public function RemoveList()
        {
            removeEventListener(Event.ENTER_FRAME, OnEnterRepositionWindow);
            if (list_mc != null)
            {
                candidateList.DestroyList();
                MovieClip(this).removeChild(list_mc);
                isCandListOpen = false;
                isListCreated = false;
                list_mc = null;
            }
            return;
        }// end function

        public function RemoveInputWindow() : void
        {
            if (inputWindow_mc != null && inputWindow_mc != null)
            {
                MovieClip(this).removeChild(inputWindow_mc);
                inputWindow_mc = null;
            }
            return;
        }// end function

        public function RepositionCandWindow(param1:Number, param2:Number, param3:Number) : void
        {
            candListx = param1;
            candListy1 = param2;
            candListy2 = param2 - param3;
            if (isListCreated)
            {
                addEventListener(Event.ENTER_FRAME, OnEnterRepositionWindow);
            }
            return;
        }// end function

        public function OnEnterRepositionWindow() : void
        {
            var _loc_1:* = NaN;
            if (isCandListOpen)
            {
                removeEventListener(Event.ENTER_FRAME, OnEnterRepositionWindow);
                _loc_1 = 0;
                if (inputWindow_mc != null)
                {
                    inputWindowHeight = inputWindow_mc.readingWindowTextFld.height;
                }
                else
                {
                    inputWindowHeight = 0;
                }
                playerWindowH = stage.stageHeight;
                playerWindowW = stage.stageWidth;
                RepositionWindow(candListx, candListy1, inputWindowHeight, candListy2, playerWindowW, playerWindowH);
            }
            return;
        }// end function

        function frame1()
        {
            Repositioned = false;
            candidateList = new FxCandidateListBox();
            candidateList.RegisterPostDisplayCallback(DisplayCallback);
            isCandListOpen = false;
            isListCreated = false;
            candListHeight = 0;
            readingWindowTextColor = 0;
            readingWindowBckgndColor = 15725300;
            readingWindowFontSize = 20;
            inputWindowHeight = 0;
            candListx = 0;
            candListy1 = 0;
            candListy2 = 0;
            return;
        }// end function

    }
}
