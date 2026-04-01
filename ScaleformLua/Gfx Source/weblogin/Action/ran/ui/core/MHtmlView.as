package ran.ui.core
{
    import flash.events.*;
    import ran.ui.*;
    import scaleform.clik.core.*;

    public class MHtmlView extends UIComponent
    {
        private var _binding:int = -1;

        public function MHtmlView()
        {
            return;
        }// end function

        public function set binding(param1:int) : void
        {
            this._binding = param1;
            return;
        }// end function

        public function get binding() : int
        {
            return this._binding;
        }// end function

        override protected function removeToStage(event:Event) : void
        {
            super.removeToStage(event);
            if (DataAdapter.visibleHtmlView != null)
            {
                DataAdapter.visibleHtmlView(this.binding, false, "");
            }
            return;
        }// end function

        public function SetVisible(param1:int, param2:String) : void
        {
            if (DataAdapter.visibleHtmlView != null)
            {
                DataAdapter.visibleHtmlView(this.binding, param1 == 0 ? (false) : (true), param2);
            }
            return;
        }// end function

    }
}
