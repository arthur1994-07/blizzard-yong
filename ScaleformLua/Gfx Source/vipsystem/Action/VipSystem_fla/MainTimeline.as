package VipSystem_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var tfDailyReward:TextField;
        public var tfRankBenefit:TextField;
        public var tfRankBenefitTitle:TextField;
        public var tfMyVipRank:TextField;
        public var VipMarkS:MovieClip;
        public var VipMarktab1:Button;
        public var VipMarktab2:Button;
        public var VipMarktab3:Button;
        public var VipMarktab4:Button;
        public var VipMarktab5:Button;
        public var DailyRewardListScBar:ScrollBar;
        public var DailyRewardList:ScrollingList;
        public var RankBenefitListScBar:ScrollBar;
        public var RankBenefitList:ScrollingList;
        public var labelMRewardTitle:Label;
        public var mlabelMRewardItem1:Label;
        public var mlabelMRewardItem2:Label;
        public var btMRewardget1:Button;
        public var btMRewardget2:Button;
        public var btBenefitReceiveAll:Button;
        public var btWebGo:Button;
        public var MRewardItemSlot1:Slot;
        public var MRewardItemSlot2:Slot;
        public var DailyRewardListSlot1:ListItemRenderer;
        public var DailyRewardListSlot2:ListItemRenderer;
        public var DailyRewardListSlot3:ListItemRenderer;
        public var DailyRewardListSlot4:ListItemRenderer;
        public var DailyRewardListSlot5:ListItemRenderer;
        public var RankBenefitListSlot1:ListItemRenderer;
        public var RankBenefitListSlot2:ListItemRenderer;
        public var RankBenefitListSlot3:ListItemRenderer;
        public var RankBenefitListSlot4:ListItemRenderer;
        public var RankBenefitListSlot5:ListItemRenderer;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_DailyRewardList_Scene1_List_0();
            this.__setProp_RankBenefitList_Scene1_List_0();
            this.__setProp_DailyRewardListScBar_Scene1_List_0();
            this.__setProp_RankBenefitListScBar_Scene1_List_0();
            this.__setProp_labelMRewardTitle_Scene1_text_0();
            return;
        }// end function

        function __setProp_DailyRewardList_Scene1_List_0()
        {
            try
            {
                this.DailyRewardList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DailyRewardList.enabled = true;
            this.DailyRewardList.focusable = true;
            this.DailyRewardList.itemRendererName = "DefaultListItemRenderer";
            this.DailyRewardList.itemRendererInstanceName = "DailyRewardListSlot";
            this.DailyRewardList.margin = 0;
            this.DailyRewardList.multiSelect = false;
            this.DailyRewardList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.DailyRewardList.rowHeight = 0;
            this.DailyRewardList.scrollBar = "DailyRewardListScBar";
            this.DailyRewardList.treeButtonClassName = "";
            this.DailyRewardList.treeButtonGap = -1;
            this.DailyRewardList.treeCheckBoxClassName = "";
            this.DailyRewardList.treeList = false;
            this.DailyRewardList.visible = true;
            this.DailyRewardList.wrapping = "normal";
            try
            {
                this.DailyRewardList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RankBenefitList_Scene1_List_0()
        {
            try
            {
                this.RankBenefitList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RankBenefitList.enabled = true;
            this.RankBenefitList.focusable = true;
            this.RankBenefitList.itemRendererName = "DefaultListItemRenderer";
            this.RankBenefitList.itemRendererInstanceName = "RankBenefitListSlot";
            this.RankBenefitList.margin = 0;
            this.RankBenefitList.multiSelect = false;
            this.RankBenefitList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.RankBenefitList.rowHeight = 0;
            this.RankBenefitList.scrollBar = "RankBenefitListScBar";
            this.RankBenefitList.treeButtonClassName = "";
            this.RankBenefitList.treeButtonGap = -1;
            this.RankBenefitList.treeCheckBoxClassName = "";
            this.RankBenefitList.treeList = false;
            this.RankBenefitList.visible = true;
            this.RankBenefitList.wrapping = "normal";
            try
            {
                this.RankBenefitList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_DailyRewardListScBar_Scene1_List_0()
        {
            try
            {
                this.DailyRewardListScBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.DailyRewardListScBar.enabled = true;
            this.DailyRewardListScBar.minThumbSize = 10;
            this.DailyRewardListScBar.offsetBottom = 0;
            this.DailyRewardListScBar.offsetTop = 0;
            this.DailyRewardListScBar.scrollTarget = "DailyRewardList";
            this.DailyRewardListScBar.trackMode = "scrollPage";
            this.DailyRewardListScBar.visible = true;
            try
            {
                this.DailyRewardListScBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RankBenefitListScBar_Scene1_List_0()
        {
            try
            {
                this.RankBenefitListScBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RankBenefitListScBar.enabled = true;
            this.RankBenefitListScBar.minThumbSize = 10;
            this.RankBenefitListScBar.offsetBottom = 0;
            this.RankBenefitListScBar.offsetTop = 0;
            this.RankBenefitListScBar.scrollTarget = "RankBenefitList";
            this.RankBenefitListScBar.trackMode = "scrollPage";
            this.RankBenefitListScBar.visible = true;
            try
            {
                this.RankBenefitListScBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMRewardTitle_Scene1_text_0()
        {
            try
            {
                this.labelMRewardTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMRewardTitle.autoSize = "center";
            this.labelMRewardTitle.autoSizeEnable = false;
            this.labelMRewardTitle.enabled = true;
            this.labelMRewardTitle.text = "";
            this.labelMRewardTitle.visible = true;
            try
            {
                this.labelMRewardTitle["componentInspectorSetting"] = false;
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
