package 
{
    import flash.display.*;
    import flash.events.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.events.*;

    dynamic public class TrainingQuestSlot extends MMaskedListItemRenderer
    {
        public var TrMenuTitle:Label;
        public var TrGaugeText:Label;
        public var TrMenuPlusBtn:Button;
        public var TrRefreshButton:Button;
        public var BtnTrGo:Button;
        public var TrMenuGauge:StatusIndicator;
        public var TrMenuIcon:MovieClip;

        public function TrainingQuestSlot()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_TrMenuPlusBtn_TrainingQuestSlot_btn_0();
            return;
        }// end function

        public function onRollOverUpgradeBtn(event:MouseEvent) : void
        {
            this.tooltipCheck = false;
            var _loc_2:* = new SimpleTooltipEvent(SimpleTooltipEvent.OPEN);
            _loc_2.localX = this.TrMenuPlusBtn.x;
            _loc_2.localY = 0;
            _loc_2.component = this;
            var _loc_3:* = this.TrMenuPlusBtn.parent;
            while (_loc_3 != null)
            {
                
                _loc_2.localX = _loc_2.localX + _loc_3.x;
                _loc_2.localY = _loc_2.localY + _loc_3.y;
                _loc_3 = _loc_3.parent;
            }
            _loc_2.tooltip = data.upgradeTooltip;
            _loc_2.htmlText = true;
            stage.dispatchEvent(_loc_2);
            return;
        }// end function

        public function onRollOutUpgradeBtn(event:MouseEvent) : void
        {
            this.tooltipCheck = true;
            if (stage == null)
            {
                return;
            }
            var _loc_2:* = new SimpleTooltipEvent(SimpleTooltipEvent.CLOSE);
            _loc_2.component = this;
            _loc_2.removeUI = true;
            stage.dispatchEvent(_loc_2);
            return;
        }// end function

        function __setProp_TrMenuPlusBtn_TrainingQuestSlot_btn_0()
        {
            try
            {
                this.TrMenuPlusBtn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TrMenuPlusBtn.autoRepeat = false;
            this.TrMenuPlusBtn.autoSize = "none";
            this.TrMenuPlusBtn.enabled = true;
            this.TrMenuPlusBtn.focusable = true;
            this.TrMenuPlusBtn.groupName = "";
            this.TrMenuPlusBtn.label = "+";
            this.TrMenuPlusBtn.overlayAlign = "none";
            this.TrMenuPlusBtn.overlayImg = "";
            this.TrMenuPlusBtn.overlayPadding = {x:0, y:0};
            this.TrMenuPlusBtn.selected = false;
            this.TrMenuPlusBtn.toggle = false;
            this.TrMenuPlusBtn.visible = true;
            try
            {
                this.TrMenuPlusBtn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            this.TrMenuPlusBtn.TooltipEnabled = false;
            this.TrMenuPlusBtn.addEventListener(MouseEvent.ROLL_OVER, this.onRollOverUpgradeBtn, false, 0, true);
            this.TrMenuPlusBtn.addEventListener(MouseEvent.ROLL_OUT, this.onRollOutUpgradeBtn, false, 0, true);
            return;
        }// end function

    }
}
