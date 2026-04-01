package Lotto_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class Lotto_Win_5 extends MovieClip
    {
        public var tfName:TextField;
        public var item5:ListItemRenderer_Win;
        public var item6:ListItemRenderer_Win;
        public var Lotto_ball_slot7:MovieClip;
        public var Lotto_ball_slot6:MovieClip;
        public var Lotto_ball_slot5:MovieClip;
        public var Lotto_ball_slot4:MovieClip;
        public var tfCount:TextField;
        public var tfNum1:TextField;
        public var tfNum2:TextField;
        public var tfResult:TextField;
        public var tfNum3:TextField;
        public var tfNum4:TextField;
        public var tfWinnerNum:TextField;
        public var tfNum5:TextField;
        public var tfMoney:TextField;
        public var tfNum6:TextField;
        public var tfRanking:TextField;
        public var tfNum7:TextField;
        public var item1:ListItemRenderer_Win;
        public var tfCumulativeResult:TextField;
        public var item2:ListItemRenderer_Win;
        public var Lotto_ball_slot3:MovieClip;
        public var tfBonus:TextField;
        public var item3:ListItemRenderer_Win;
        public var Lotto_ball_slot2:MovieClip;
        public var item4:ListItemRenderer_Win;
        public var Lotto_ball_slot1:MovieClip;
        public var labelCumulateMoney:Label;
        public var comboResult:DropdownMenu;
        public var scrollBar:ScrollBar;
        public var list:ScrollingList;

        public function Lotto_Win_5()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_comboResult_Lotto_Win_button_0();
            this.__setProp_labelCumulateMoney_Lotto_Win_button_0();
            this.__setProp_list_Lotto_Win_List_0();
            this.__setProp_scrollBar_Lotto_Win_List_0();
            return;
        }// end function

        function __setProp_comboResult_Lotto_Win_button_0()
        {
            try
            {
                this.comboResult["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboResult.autoSize = "none";
            this.comboResult.dropdown = "DefaultScrollingList";
            this.comboResult.enabled = true;
            this.comboResult.focusable = false;
            this.comboResult.groupName = "";
            this.comboResult.itemRenderer = "DefaultListItemRenderer";
            this.comboResult.menuDirection = "down";
            this.comboResult.menuMargin = 1;
            this.comboResult.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboResult.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboResult.menuRowCount = 5;
            this.comboResult.menuRowsFixed = true;
            this.comboResult.menuWidth = -1;
            this.comboResult.menuWrapping = "normal";
            this.comboResult.overlayAlign = "none";
            this.comboResult.overlayImg = "";
            this.comboResult.overlayPadding = {x:0, y:0};
            this.comboResult.scrollBar = "DefaultScrollBar";
            this.comboResult.inspectableThumbOffset = {top:0, bottom:0};
            this.comboResult.visible = true;
            try
            {
                this.comboResult["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCumulateMoney_Lotto_Win_button_0()
        {
            try
            {
                this.labelCumulateMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCumulateMoney.autoSize = "right";
            this.labelCumulateMoney.enabled = true;
            this.labelCumulateMoney.text = "";
            this.labelCumulateMoney.visible = true;
            try
            {
                this.labelCumulateMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_Lotto_Win_List_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = true;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "item";
            this.list.margin = 0;
            this.list.multiSelect = false;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "";
            this.list.treeButtonClassName = "";
            this.list.treeButtonGap = -1;
            this.list.treeCheckBoxClassName = "";
            this.list.treeList = false;
            this.list.visible = true;
            this.list.wrapping = "normal";
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scrollBar_Lotto_Win_List_0()
        {
            try
            {
                this.scrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scrollBar.enabled = true;
            this.scrollBar.minThumbSize = 6;
            this.scrollBar.offsetBottom = 0;
            this.scrollBar.offsetTop = 0;
            this.scrollBar.scrollTarget = "list";
            this.scrollBar.trackMode = "scrollPage";
            this.scrollBar.visible = true;
            try
            {
                this.scrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
