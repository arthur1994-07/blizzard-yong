package ActivityRecord_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.data.*;

    dynamic public class ProfilePage_49 extends MovieClip
    {
        public var rtClubIcon:RenderTextureClubIcon;
        public var Lv1Info:TextField;
        public var ClubTextTitle:Label;
        public var ClubNameText:Label;
        public var StatTextTitle:Label;
        public var StatText:Label;
        public var LvTextTitle:Label;
        public var ProfileTitle:Label;
        public var PlayerName:TextField;
        public var PlayerLvImg:MovieClip;
        public var LvLine:MovieClip;
        public var LvMaxInfo:TextField;
        public var list:MMaskedList;
        public var listData:Array;

        public function ProfilePage_49()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_ProfilePage_list_0();
            this.__setProp_ClubTextTitle_ProfilePage_text_0();
            this.__setProp_StatTextTitle_ProfilePage_text_0();
            this.__setProp_StatText_ProfilePage_text_0();
            this.__setProp_LvTextTitle_ProfilePage_text_0();
            return;
        }// end function

        public function SetDynamicText(param1:String, param2:String, param3:String, param4:String) : void
        {
            this.PlayerName.text = param1;
            this.ClubNameText.text = param2;
            this.StatText.text = param3;
            this.StatText.TooltipText = param4;
            return;
        }// end function

        public function SetStaticText(param1:String, param2:String, param3:String) : void
        {
            this.ClubTextTitle.text = param1;
            this.StatTextTitle.text = param2;
            this.ProfileTitle.text = param3;
            return;
        }// end function

        public function SetSex(param1:String) : void
        {
            var _loc_2:* = int(param1);
            switch(_loc_2)
            {
                case 0:
                {
                    this.PlayerLvImg.gender_img.gotoAndStop("female");
                    break;
                }
                case 1:
                {
                    this.PlayerLvImg.gender_img.gotoAndStop("male");
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function SetLevel(param1:String, param2:String) : void
        {
            var _loc_3:* = int(param1);
            var _loc_4:* = int(param2);
            var _loc_5:* = _loc_3 / _loc_4;
            var _loc_6:* = this.LvLine.width * _loc_5 + this.LvLine.x;
            this.PlayerLvImg.x = _loc_6;
            this.PlayerLvImg.PlayerLvlText.text = "Lv " + param1;
            this.LvMaxInfo.text = param2;
            return;
        }// end function

        public function ClearListItem() : void
        {
            this.listData = [];
            this.list.dataProvider = new DataProvider(this.listData);
            return;
        }// end function

        public function AddListItem(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : void
        {
            var _loc_7:* = int(param1);
            var _loc_8:* = Number(param4);
            var _loc_9:* = Number(param5);
            var _loc_10:* = new Object();
            _loc_10.index = _loc_7;
            _loc_10.label1 = param2;
            _loc_10.label2 = param3;
            _loc_10.tooltip1 = param6;
            _loc_10.value = _loc_8;
            _loc_10.max = _loc_9;
            this.listData.push(_loc_10);
            this.listData.sortOn("index", Array.NUMERIC);
            this.list.dataProvider = new DataProvider(this.listData);
            return;
        }// end function

        public function ModifyListItem(param1:String, param2:String, param3:String) : void
        {
            var _loc_4:* = int(param1);
            var _loc_5:* = Number(param3);
            if (this.listData.length <= _loc_4)
            {
                return;
            }
            var _loc_6:* = this.listData[_loc_4];
            _loc_6.label2 = param2;
            _loc_6.value = _loc_5;
            this.list.dataProvider = new DataProvider(this.listData);
            return;
        }// end function

        public function UpdateListItemBar() : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            this.list.validateNow();
            var _loc_1:* = 0;
            while (_loc_1 < this.listData.length)
            {
                
                _loc_2 = "item" + _loc_1;
                _loc_3 = this.list.mcItemRenderer.getChildByName(_loc_2) as MMaskedListItemRenderer;
                if (_loc_3 == null)
                {
                    return;
                }
                _loc_4 = _loc_3.getChildByName("prStat") as StatusIndicator;
                if (_loc_4 == null)
                {
                    return;
                }
                _loc_5 = this.listData[_loc_1];
                _loc_4.minimum = 0;
                _loc_4.maximum = _loc_5.max;
                _loc_4.value = _loc_5.value;
                _loc_1++;
            }
            return;
        }// end function

        function __setProp_list_ProfilePage_list_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.itemRendererName = "StatDetailComponent";
            this.list.itemRendererOffset = {x:0, y:2};
            this.list.maskHeight = -1;
            this.list.maskWidth = -1;
            this.list.multiSelectable = false;
            this.list.rowCount = 1;
            this.list.scrollBarName = "NewScrollBar";
            this.list.scrollSpeed = 5;
            this.list.visible = true;
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ClubTextTitle_ProfilePage_text_0()
        {
            try
            {
                this.ClubTextTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ClubTextTitle.autoSize = "none";
            this.ClubTextTitle.autoSizeEnable = false;
            this.ClubTextTitle.enabled = true;
            this.ClubTextTitle.text = "Club";
            this.ClubTextTitle.visible = true;
            try
            {
                this.ClubTextTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_StatTextTitle_ProfilePage_text_0()
        {
            try
            {
                this.StatTextTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.StatTextTitle.autoSize = "right";
            this.StatTextTitle.autoSizeEnable = false;
            this.StatTextTitle.enabled = true;
            this.StatTextTitle.text = "";
            this.StatTextTitle.visible = true;
            try
            {
                this.StatTextTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_StatText_ProfilePage_text_0()
        {
            try
            {
                this.StatText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.StatText.autoSize = "right";
            this.StatText.autoSizeEnable = false;
            this.StatText.enabled = true;
            this.StatText.text = "";
            this.StatText.visible = true;
            try
            {
                this.StatText["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LvTextTitle_ProfilePage_text_0()
        {
            try
            {
                this.LvTextTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LvTextTitle.autoSize = "right";
            this.LvTextTitle.autoSizeEnable = false;
            this.LvTextTitle.enabled = true;
            this.LvTextTitle.text = "Level";
            this.LvTextTitle.visible = true;
            try
            {
                this.LvTextTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            this.listData = [];
            return;
        }// end function

    }
}
