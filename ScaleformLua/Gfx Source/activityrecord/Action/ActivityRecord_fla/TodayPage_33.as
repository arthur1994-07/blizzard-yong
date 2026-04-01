package ActivityRecord_fla
{
    import flash.display.*;
    import flash.external.*;
    import flash.text.*;
    import ran.ui.core.*;
    import ran.ui.slot.*;
    import ran.ui.utils.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.motion.*;

    dynamic public class TodayPage_33 extends MovieClip
    {
        public var QuestDaily:RadioButton;
        public var QuestWeekly:RadioButton;
        public var QuestMonthly:RadioButton;
        public var tfAutoRefreshText:TextField;
        public var btnRefreshList:Button;
        public var QuestDailyText:Label;
        public var QuestWeeklyText:Label;
        public var QuestMonthlyText:Label;
        public var QuestTip:TextField;
        public var QuestTipScrollBar:ScrollBar;
        public var watchProcessMsg:CheckBox;
        public var QuestslotM1:MMaskedListItemRenderer;
        public var list:MMaskedList;
        public var currentView:int;
        public var TopDataDay:Object;
        public var TopDataWeek:Object;
        public var TopDataMonth:Object;
        public var DataDay:Array;
        public var DataWeek:Array;
        public var DataMonth:Array;

        public function TodayPage_33()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_QuestTipScrollBar_TodayPage_bg_0();
            this.__setProp_QuestDaily_TodayPage_text_0();
            this.__setProp_QuestWeekly_TodayPage_text_0();
            this.__setProp_QuestMonthly_TodayPage_text_0();
            this.__setProp_btnRefreshList_TodayPage_text_0();
            this.__setProp_watchProcessMsg_TodayPage_Button_0();
            this.__setProp_list_TodayPage_List_0();
            return;
        }// end function

        public function onDayRadioClick(event:ButtonEvent) : void
        {
            this.currentView = 0;
            this.ChangeView();
            return;
        }// end function

        public function onWeekRadioClick(event:ButtonEvent) : void
        {
            this.currentView = 1;
            this.ChangeView();
            return;
        }// end function

        public function onMonthRadioClick(event:ButtonEvent) : void
        {
            this.currentView = 2;
            this.ChangeView();
            return;
        }// end function

        public function ChangeView() : void
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            switch(this.currentView)
            {
                case 0:
                {
                    _loc_1 = this.TopDataDay;
                    _loc_2 = this.DataDay;
                    break;
                }
                case 1:
                {
                    _loc_1 = this.TopDataWeek;
                    _loc_2 = this.DataWeek;
                    break;
                }
                case 2:
                {
                    _loc_1 = this.TopDataMonth;
                    _loc_2 = this.DataMonth;
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (_loc_2 == null && _loc_1 == null)
            {
                return;
            }
            _loc_2.sortOn("index", Array.NUMERIC);
            this.list.dataProvider = new DataProvider(_loc_2);
            this.SetMainItem(_loc_1);
            this.UpdateListItem();
            this.NotifyChangeView();
            return;
        }// end function

        public function NotifyChangeView() : void
        {
            var _loc_1:* = [Util.OBJ_TYPE_INT];
            var _loc_2:* = [this.currentView];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_TM_ChangeView", _loc_1, _loc_2);
            return;
        }// end function

        public function SetStaticText(param1:String, param2:String, param3:String) : void
        {
            this.QuestDailyText.text = param1;
            this.QuestWeeklyText.text = param2;
            this.QuestMonthlyText.text = param3;
            return;
        }// end function

        public function SetTipText(param1:String) : void
        {
            this.QuestTip.text = param1;
            return;
        }// end function

        public function SetMainItem(param1:Object) : void
        {
            if (param1 == null)
            {
                return;
            }
            var _loc_2:* = int(param1["type"]);
            switch(_loc_2)
            {
                case 0:
                {
                    this.TopDataDay = param1;
                    break;
                }
                case 1:
                {
                    this.TopDataWeek = param1;
                    break;
                }
                case 2:
                {
                    this.TopDataMonth = param1;
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (_loc_2 == this.currentView)
            {
                this.QuestslotM1.data = param1;
                this.UpdateItem(this.QuestslotM1, param1, -1);
            }
            return;
        }// end function

        public function ClearListItem(param1:String) : void
        {
            var _loc_2:* = int(param1);
            switch(_loc_2)
            {
                case 0:
                {
                    this.DataDay = [];
                    break;
                }
                case 1:
                {
                    this.DataWeek = [];
                    break;
                }
                case 2:
                {
                    this.DataMonth = [];
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (this.currentView == _loc_2)
            {
                this.list.dataProvider = new DataProvider();
            }
            return;
        }// end function

        public function AddListItem(param1:Object) : void
        {
            var _loc_2:* = int(param1["index"]);
            var _loc_3:* = int(param1["type"]);
            switch(_loc_2)
            {
                case 0:
                case 1:
                case 2:
                {
                    if (this.currentView == _loc_3)
                    {
                        this.SetMainItem(param1);
                    }
                    return;
                }
                default:
                {
                    break;
                }
            }
            var _loc_4:* = null;
            switch(_loc_3)
            {
                case 0:
                {
                    this.DataDay.push(param1);
                    _loc_4 = this.DataDay;
                    break;
                }
                case 1:
                {
                    this.DataWeek.push(param1);
                    _loc_4 = this.DataWeek;
                    break;
                }
                case 2:
                {
                    this.DataMonth.push(param1);
                    _loc_4 = this.DataMonth;
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (_loc_4 == null)
            {
                return;
            }
            if (this.currentView == _loc_3)
            {
                _loc_4.sortOn("index", Array.NUMERIC);
                this.list.dataProvider = new DataProvider(_loc_4);
            }
            return;
        }// end function

        public function UpdateListItem() : void
        {
            var _loc_2:* = null;
            this.list.validateNow();
            var _loc_1:* = 0;
            while (_loc_1 < this.list.dataProvider.length)
            {
                
                _loc_2 = this.list.mcItemRenderer.getChildByName("item" + _loc_1) as MMaskedListItemRenderer;
                if (_loc_2 == null)
                {
                }
                else
                {
                    this.UpdateItem(_loc_2, this.list.dataProvider[_loc_1], _loc_1);
                }
                _loc_1++;
            }
            return;
        }// end function

        public function UpdateItem(param1:MMaskedListItemRenderer, param2:Object, param3:int) : void
        {
            var _loc_11:* = null;
            var _loc_12:* = null;
            if (param1 == null || param2 == null)
            {
                return;
            }
            var _loc_4:* = int(param2["index"]);
            switch(_loc_4)
            {
                case 0:
                case 1:
                case 2:
                {
                    break;
                }
                default:
                {
                    var _loc_13:* = param1;
                    _loc_13["SetBgColor"](5592405);
                    break;
                    break;
                }
            }
            var _loc_5:* = param1.getChildByName("RecordIcon") as MovieClip;
            if (_loc_5 != null)
            {
                _loc_11 = "";
                switch(int(param2.category))
                {
                    case 0:
                    case 17:
                    {
                        var _loc_13:* = "Daily";
                        _loc_11 = "Daily";
                        break;
                    }
                    case 1:
                    {
                        var _loc_13:* = "Weekly";
                        _loc_11 = "Weekly";
                        break;
                    }
                    case 2:
                    {
                        var _loc_13:* = "AllClear";
                        _loc_11 = "AllClear";
                        break;
                    }
                    case 3:
                    case 18:
                    {
                        var _loc_13:* = "Time";
                        _loc_11 = "Time";
                        break;
                    }
                    case 5:
                    case 6:
                    {
                        var _loc_13:* = "Training";
                        _loc_11 = "Training";
                        break;
                    }
                    case 4:
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                    case 12:
                    {
                        var _loc_13:* = "Edit";
                        _loc_11 = "Edit";
                        break;
                    }
                    case 13:
                    {
                        var _loc_13:* = "LevelUp";
                        _loc_11 = "LevelUp";
                        break;
                    }
                    case 14:
                    case 15:
                    case 16:
                    {
                        var _loc_13:* = "Ranking";
                        _loc_11 = "Ranking";
                        break;
                    }
                    case 19:
                    case 20:
                    case 24:
                    {
                        var _loc_13:* = "PVP";
                        _loc_11 = "PVP";
                        break;
                    }
                    case 21:
                    case 22:
                    case 23:
                    case 25:
                    {
                        var _loc_13:* = "PVE";
                        _loc_11 = "PVE";
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
                _loc_5.gotoAndStop(_loc_11);
            }
            var _loc_6:* = param1.getChildByName("QuestStatusIndicator") as StatusIndicator;
            if (_loc_6 != null)
            {
                var _loc_13:* = Number(param2.max);
                _loc_6.maximum = Number(param2.max);
                var _loc_13:* = Number(param2.value);
                _loc_6.value = Number(param2.value);
            }
            var _loc_7:* = param1.getChildByName("ItemGold") as UIComponent;
            if (_loc_7 != null)
            {
                var _loc_13:* = param2.money;
                _loc_7.TooltipText = param2.money;
            }
            var _loc_8:* = param1.getChildByName("ItemEXP") as UIComponent;
            if (_loc_8 != null)
            {
                var _loc_13:* = param2.exp;
                _loc_8.TooltipText = param2.exp;
            }
            var _loc_9:* = param1.getChildByName("ItemSlot") as Slot;
            if (_loc_9 != null)
            {
                var _loc_13:* = param2.binding;
                _loc_9.binding = param2.binding;
            }
            var _loc_10:* = param1.getChildByName("btnQuest") as Button;
            if (_loc_10 != null)
            {
                _loc_12 = {index:int(param2["index"])};
                var _loc_13:* = _loc_12;
                _loc_10.data = _loc_12;
                var _loc_13:* = int(param2.reward) == 0 ? (false) : (true);
                _loc_10.enabled = int(param2.reward) == 0 ? (false) : (true);
                var _loc_13:* = param2.btnText;
                _loc_10.label = param2.btnText;
                _loc_10.addEventListener(ButtonEvent.CLICK, this.onItemBtnClick, false, 0, true);
            }
            return;
        }// end function

        public function SetItemBtnEnable(param1:Object) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (this.currentView != int(param1.type))
            {
                return;
            }
            var _loc_2:* = 0;
            while (_loc_2 < this.list.dataProvider.length)
            {
                
                _loc_3 = this.list.dataProvider[_loc_2];
                if (_loc_3.category != param1.index)
                {
                }
                else
                {
                    _loc_4 = this.list.mcItemRenderer.getChildByName("item" + _loc_2) as MMaskedListItemRenderer;
                    _loc_5 = _loc_4.getChildByName("btnQuest") as Button;
                    if (_loc_5 != null)
                    {
                        var _loc_6:* = param1.enabled == "1" ? (true) : (false);
                        _loc_5.enabled = param1.enabled == "1" ? (true) : (false);
                    }
                    break;
                }
                _loc_2++;
            }
            return;
        }// end function

        public function onItemBtnClick(event:ButtonEvent) : void
        {
            var _loc_2:* = event.target as Button;
            var _loc_3:* = [Util.OBJ_TYPE_INT, Util.OBJ_TYPE_INT];
            var _loc_4:* = [this.currentView, _loc_2.data.index];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_TM_ItemBtnClick", _loc_3, _loc_4);
            return;
        }// end function

        public function onRefreshClick(event:ButtonEvent) : void
        {
            this.onCompleteRefreshTimer(null);
            return;
        }// end function

        public function onUpdateRefreshTimer(param1:Tween) : void
        {
            var _loc_2:* = 60 - this.btnRefreshList._tween.position / 1000;
            var _loc_3:* = _loc_2 / 60;
            var _loc_4:* = _loc_2 % 60;
            var _loc_5:* = "";
            if (_loc_3 < 10)
            {
                var _loc_7:* = "0" + _loc_3;
                _loc_5 = "0" + _loc_3;
            }
            else
            {
                var _loc_7:* = "" + _loc_3;
                _loc_5 = "" + _loc_3;
            }
            var _loc_6:* = "";
            if (_loc_4 < 10)
            {
                var _loc_7:* = "0" + _loc_4;
                _loc_6 = "0" + _loc_4;
            }
            else
            {
                var _loc_7:* = "" + _loc_4;
                _loc_6 = "" + _loc_4;
            }
            var _loc_7:* = _loc_5 + " : " + _loc_6;
            this.tfAutoRefreshText.text = _loc_5 + " : " + _loc_6;
            return;
        }// end function

        public function onCompleteRefreshTimer(param1:Tween) : void
        {
            if (this.btnRefreshList._tween != null)
            {
                Tween.removeTween(this.btnRefreshList._tween);
                var _loc_2:* = null;
                this.btnRefreshList._tween = null;
            }
            var _loc_2:* = new Tween(60000, this.btnRefreshList, {}, {onComplete:this.onCompleteRefreshTimer, onChange:this.onUpdateRefreshTimer});
            this.btnRefreshList._tween = new Tween(60000, this.btnRefreshList, {}, {onComplete:this.onCompleteRefreshTimer, onChange:this.onUpdateRefreshTimer});
            this.ChangeView();
            return;
        }// end function

        function __setProp_QuestTipScrollBar_TodayPage_bg_0()
        {
            try
            {
                var _loc_2:* = true;
                this.QuestTipScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            var _loc_2:* = true;
            this.QuestTipScrollBar.enabled = true;
            var _loc_2:* = 10;
            this.QuestTipScrollBar.minThumbSize = 10;
            var _loc_2:* = 0;
            this.QuestTipScrollBar.offsetBottom = 0;
            var _loc_2:* = 0;
            this.QuestTipScrollBar.offsetTop = 0;
            var _loc_2:* = "QuestTip";
            this.QuestTipScrollBar.scrollTarget = "QuestTip";
            var _loc_2:* = "scrollPage";
            this.QuestTipScrollBar.trackMode = "scrollPage";
            var _loc_2:* = true;
            this.QuestTipScrollBar.visible = true;
            try
            {
                var _loc_2:* = false;
                this.QuestTipScrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_QuestDaily_TodayPage_text_0()
        {
            try
            {
                var _loc_2:* = true;
                this.QuestDaily["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            var _loc_2:* = "none";
            this.QuestDaily.autoSize = "none";
            var _loc_2:* = true;
            this.QuestDaily.enabled = true;
            var _loc_2:* = false;
            this.QuestDaily.focusable = false;
            var _loc_2:* = "Mission";
            this.QuestDaily.groupName = "Mission";
            var _loc_2:* = "";
            this.QuestDaily.label = "";
            var _loc_2:* = "none";
            this.QuestDaily.overlayAlign = "none";
            var _loc_2:* = "";
            this.QuestDaily.overlayImg = "";
            var _loc_2:* = {x:0, y:0};
            this.QuestDaily.overlayPadding = {x:0, y:0};
            var _loc_2:* = false;
            this.QuestDaily.selected = false;
            var _loc_2:* = true;
            this.QuestDaily.visible = true;
            try
            {
                var _loc_2:* = false;
                this.QuestDaily["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_QuestWeekly_TodayPage_text_0()
        {
            try
            {
                var _loc_2:* = true;
                this.QuestWeekly["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            var _loc_2:* = "none";
            this.QuestWeekly.autoSize = "none";
            var _loc_2:* = true;
            this.QuestWeekly.enabled = true;
            var _loc_2:* = false;
            this.QuestWeekly.focusable = false;
            var _loc_2:* = "Mission";
            this.QuestWeekly.groupName = "Mission";
            var _loc_2:* = "";
            this.QuestWeekly.label = "";
            var _loc_2:* = "none";
            this.QuestWeekly.overlayAlign = "none";
            var _loc_2:* = "";
            this.QuestWeekly.overlayImg = "";
            var _loc_2:* = {x:0, y:0};
            this.QuestWeekly.overlayPadding = {x:0, y:0};
            var _loc_2:* = false;
            this.QuestWeekly.selected = false;
            var _loc_2:* = true;
            this.QuestWeekly.visible = true;
            try
            {
                var _loc_2:* = false;
                this.QuestWeekly["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_QuestMonthly_TodayPage_text_0()
        {
            try
            {
                var _loc_2:* = true;
                this.QuestMonthly["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            var _loc_2:* = "none";
            this.QuestMonthly.autoSize = "none";
            var _loc_2:* = true;
            this.QuestMonthly.enabled = true;
            var _loc_2:* = false;
            this.QuestMonthly.focusable = false;
            var _loc_2:* = "Mission";
            this.QuestMonthly.groupName = "Mission";
            var _loc_2:* = "";
            this.QuestMonthly.label = "";
            var _loc_2:* = "none";
            this.QuestMonthly.overlayAlign = "none";
            var _loc_2:* = "";
            this.QuestMonthly.overlayImg = "";
            var _loc_2:* = {x:0, y:0};
            this.QuestMonthly.overlayPadding = {x:0, y:0};
            var _loc_2:* = false;
            this.QuestMonthly.selected = false;
            var _loc_2:* = true;
            this.QuestMonthly.visible = true;
            try
            {
                var _loc_2:* = false;
                this.QuestMonthly["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRefreshList_TodayPage_text_0()
        {
            try
            {
                var _loc_2:* = true;
                this.btnRefreshList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            var _loc_2:* = false;
            this.btnRefreshList.autoRepeat = false;
            var _loc_2:* = "none";
            this.btnRefreshList.autoSize = "none";
            var _loc_2:* = true;
            this.btnRefreshList.enabled = true;
            var _loc_2:* = false;
            this.btnRefreshList.focusable = false;
            var _loc_2:* = "";
            this.btnRefreshList.groupName = "";
            var _loc_2:* = "";
            this.btnRefreshList.label = "";
            var _loc_2:* = "none";
            this.btnRefreshList.overlayAlign = "none";
            var _loc_2:* = "";
            this.btnRefreshList.overlayImg = "";
            var _loc_2:* = {x:0, y:0};
            this.btnRefreshList.overlayPadding = {x:0, y:0};
            var _loc_2:* = false;
            this.btnRefreshList.selected = false;
            var _loc_2:* = false;
            this.btnRefreshList.toggle = false;
            var _loc_2:* = false;
            this.btnRefreshList.visible = false;
            try
            {
                var _loc_2:* = false;
                this.btnRefreshList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_watchProcessMsg_TodayPage_Button_0()
        {
            try
            {
                var _loc_2:* = true;
                this.watchProcessMsg["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            var _loc_2:* = "left";
            this.watchProcessMsg.autoSize = "left";
            var _loc_2:* = true;
            this.watchProcessMsg.enabled = true;
            var _loc_2:* = false;
            this.watchProcessMsg.focusable = false;
            var _loc_2:* = "";
            this.watchProcessMsg.groupName = "";
            var _loc_2:* = "Check Box";
            this.watchProcessMsg.label = "Check Box";
            var _loc_2:* = "none";
            this.watchProcessMsg.overlayAlign = "none";
            var _loc_2:* = "";
            this.watchProcessMsg.overlayImg = "";
            var _loc_2:* = {x:0, y:0};
            this.watchProcessMsg.overlayPadding = {x:0, y:0};
            var _loc_2:* = false;
            this.watchProcessMsg.selected = false;
            var _loc_2:* = true;
            this.watchProcessMsg.visible = true;
            try
            {
                var _loc_2:* = false;
                this.watchProcessMsg["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_TodayPage_List_0()
        {
            try
            {
                var _loc_2:* = true;
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            var _loc_2:* = true;
            this.list.enabled = true;
            var _loc_2:* = "QuestSlotComponent";
            this.list.itemRendererName = "QuestSlotComponent";
            var _loc_2:* = {x:0, y:6};
            this.list.itemRendererOffset = {x:0, y:6};
            var _loc_2:* = -1;
            this.list.maskHeight = -1;
            var _loc_2:* = -1;
            this.list.maskWidth = -1;
            var _loc_2:* = false;
            this.list.multiSelectable = false;
            var _loc_2:* = 1;
            this.list.rowCount = 1;
            var _loc_2:* = "NewScrollBar";
            this.list.scrollBarName = "NewScrollBar";
            var _loc_2:* = 5;
            this.list.scrollSpeed = 5;
            var _loc_2:* = true;
            this.list.visible = true;
            try
            {
                var _loc_2:* = false;
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            var _loc_1:* = 0;
            this.currentView = 0;
            var _loc_1:* = [];
            this.DataDay = [];
            var _loc_1:* = [];
            this.DataWeek = [];
            var _loc_1:* = [];
            this.DataMonth = [];
            var _loc_1:* = true;
            this.QuestDaily.selected = true;
            this.onDayRadioClick(null);
            this.QuestDaily.addEventListener(ButtonEvent.CLICK, this.onDayRadioClick, false, 0, true);
            this.QuestWeekly.addEventListener(ButtonEvent.CLICK, this.onWeekRadioClick, false, 0, true);
            this.QuestMonthly.addEventListener(ButtonEvent.CLICK, this.onMonthRadioClick, false, 0, true);
            var _loc_1:* = false;
            this.tfAutoRefreshText.visible = false;
            return;
        }// end function

    }
}
