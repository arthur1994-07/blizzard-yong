package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    public class MPrivateMarketDisplay extends MovieClip
    {
        public var btnMarket:Button;
        public var Id:uint;
        public var PrivateMarketButtonBG:MovieClip;

        public function MPrivateMarketDisplay()
        {
            InteractiveObjectEx.setHitTestDisable(this.btnMarket, true);
            addEventListener(MouseEvent.CLICK, this.OnClick, false, 0, true);
            this.PrivateMarketButtonBG.addEventListener(MouseEvent.MOUSE_OVER, this.PrivateMarketBG_Over, false, 0, true);
            this.PrivateMarketButtonBG.addEventListener(MouseEvent.CLICK, this.PrivateMarketBG_Down, false, 0, true);
            this.PrivateMarketButtonBG.addEventListener(MouseEvent.MOUSE_UP, this.PrivateMarketBG_Up, false, 0, true);
            this.PrivateMarketButtonBG.addEventListener(MouseEvent.MOUSE_OUT, this.PrivateMarketBG_Out, false, 0, true);
            return;
        }// end function

        protected function OnClick(param1:MouseEventEx) : void
        {
            if (param1.buttonIdx == 0)
            {
                ExternalInterface.call("OnPrivateMarketClick", this.Id);
            }
            return;
        }// end function

        protected function PrivateMarketBG_Over(event:MouseEvent) : void
        {
            this.PrivateMarketButtonBG.gotoAndPlay("over");
            return;
        }// end function

        protected function PrivateMarketBG_Down(event:MouseEvent) : void
        {
            this.PrivateMarketButtonBG.gotoAndPlay("down");
            return;
        }// end function

        protected function PrivateMarketBG_Up(event:MouseEvent) : void
        {
            this.PrivateMarketButtonBG.gotoAndPlay("up");
            return;
        }// end function

        protected function PrivateMarketBG_Out(event:MouseEvent) : void
        {
            this.PrivateMarketButtonBG.gotoAndPlay("out");
            return;
        }// end function

        public function SetID(param1:uint)
        {
            this.Id = param1;
            return;
        }// end function

        public function SetBGWidth(param1:uint)
        {
            this.PrivateMarketButtonBG.width = param1;
            return;
        }// end function

    }
}
