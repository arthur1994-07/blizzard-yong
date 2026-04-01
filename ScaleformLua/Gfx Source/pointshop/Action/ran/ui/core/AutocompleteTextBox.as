package ran.ui.core
{
    import flash.events.*;
    import flash.ui.*;
    import ran.ui.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.clik.ui.*;
    import scaleform.clik.utils.*;

    public class AutocompleteTextBox extends UIComponent
    {
        public var scrollList:ScrollingList;
        public var textInput:TextInput;
        protected var _dataProvider:IDataProvider;
        protected var history:DataProvider;

        public function AutocompleteTextBox()
        {
            this.history = new DataProvider();
            return;
        }// end function

        public function get dataProvider() : IDataProvider
        {
            return this._dataProvider;
        }// end function

        public function set dataProvider(param1:IDataProvider) : void
        {
            if (this._dataProvider == param1)
            {
                return;
            }
            this._dataProvider = param1;
            return;
        }// end function

        override protected function preInitialize() : void
        {
            constraints = new Constraints(this, ConstrainMode.REFLOW);
            return;
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            constraints.addElement("scrollList", this.scrollList, Constraints.TOP | Constraints.BOTTOM);
            constraints.addElement("textField", this.textInput, Constraints.ALL);
            stage.addEventListener(MouseEvent.CLICK, this.onClickOutside, false, 0, true);
            this.textInput.addEventListener(InputEvent.INPUT, this.onInput, false, 0, true);
            this.scrollList.addEventListener(ListEvent.ITEM_CLICK, this.onListSelect, false, 0, true);
            this.scrollList.visible = false;
            this.scrollList.selectedIndex = -1;
            this.scrollList.invalidateData();
            return;
        }// end function

        public function SelectList(param1:int) : void
        {
            if (param1 < 0 || param1 >= this.scrollList.dataProvider.length)
            {
                return;
            }
            var _loc_2:* = this.scrollList.dataProvider[param1];
            if (typeof(_loc_2) == "string")
            {
                this.textInput.text = _loc_2 as String;
            }
            else
            {
                this.textInput.text = _loc_2["label"];
            }
            this.scrollList.visible = false;
            this.scrollList.selectedIndex = -1;
            this.textInput.textField.setSelection(this.textInput.text.length, this.textInput.text.length);
            this.AddHistory(this.textInput.text);
            return;
        }// end function

        public function AddHistory(param1:String) : void
        {
            if (param1.length == 0)
            {
                return;
            }
            var _loc_2:* = 0;
            while (_loc_2 < this.history.length)
            {
                
                if (this.history[_loc_2] == param1)
                {
                    this.history.splice(_loc_2, 1);
                    break;
                }
                _loc_2++;
            }
            this.history.splice(0, 0, param1);
            return;
        }// end function

        protected function onClickOutside(event:MouseEvent) : void
        {
            if (this.hitTestPoint(event.stageX, event.stageY, true) == true)
            {
                return;
            }
            if (this.textInput == event.target || this.scrollList == event.target)
            {
                return;
            }
            this.scrollList.visible = false;
            this.scrollList.selectedIndex = -1;
            return;
        }// end function

        protected function onListSelect(event:ListEvent) : void
        {
            this.SelectList(event.index);
            return;
        }// end function

        public function onInput(event:InputEvent) : void
        {
            if (event.handled)
            {
                return;
            }
            if (this.textInput.hasFocus == false)
            {
                return;
            }
            var _loc_2:* = event.details;
            switch(_loc_2.navEquivalent)
            {
                case NavigationCode.ENTER:
                {
                    if (Keyboard.SPACE != _loc_2.code && InputValue.KEY_UP == _loc_2.value)
                    {
                        if (this.scrollList.selectedIndex == -1)
                        {
                            this.AddHistory(this.textInput.text + DataAdapter.GetCompositionString());
                        }
                        if (Keyboard.SPACE != event.keyCode && this.scrollList.visible == true)
                        {
                            this.SelectList(this.scrollList.selectedIndex);
                            return;
                        }
                    }
                    break;
                }
                case NavigationCode.UP:
                case NavigationCode.DOWN:
                {
                    if (this.scrollList.visible == true)
                    {
                        this.scrollList.handleInput(event);
                        this.scrollList.invalidateSelectedIndex();
                    }
                    break;
                }
                case NavigationCode.ESCAPE:
                {
                    if (InputValue.KEY_UP == _loc_2.value)
                    {
                        this.scrollList.visible = false;
                        this.scrollList.selectedIndex = -1;
                        return;
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (InputValue.KEY_UP == _loc_2.value)
            {
                this._dataProvider.requestItemRange(0, this._dataProvider.length, this.populateData);
            }
            return;
        }// end function

        protected function populateData(param1:Array) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = 0;
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_2:* = this.textInput.text + DataAdapter.GetCompositionString();
            var _loc_3:* = _loc_2.length;
            if (_loc_3 == 0)
            {
                this.scrollList.dataProvider = this.history;
                this.scrollList.visible = this.history.length > 0;
            }
            else
            {
                _loc_4 = new DataProvider();
                _loc_5 = 0;
                while (_loc_5 < param1.length)
                {
                    
                    if (param1[_loc_5] == null)
                    {
                    }
                    else
                    {
                        _loc_6 = param1[_loc_5]["textdata"] as String;
                        if (_loc_6.search(_loc_2) != -1)
                        {
                            _loc_7 = new Object();
                            _loc_7["label"] = _loc_6;
                            _loc_4.push(_loc_7);
                        }
                    }
                    _loc_5++;
                }
                this.scrollList.dataProvider = _loc_4;
                this.scrollList.visible = _loc_4.length > 0;
            }
            if (this.scrollList.visible == false)
            {
                this.scrollList.selectedIndex = -1;
            }
            return;
        }// end function

    }
}
