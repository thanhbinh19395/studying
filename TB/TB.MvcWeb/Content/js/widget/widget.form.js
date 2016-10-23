/* This widget contains only fields */
$.widget('widget.form', $.widget.base, {
    options: {
        name: null,
        fieldPerRow: 2,
        fields: [],
        actions: [],
        boderSpacing:0,
    },
    _create: function () {
        this.element.empty();
        this.element.append(this._createFormElement());
        var form = this.element.w2form(this.options);

        this._super();
        this._saveData(form);

    },
    _createFormElement: function () {
        var table = $('<table>')
                        .addClass('table-form') // this class needs to be added in order to styling correctly
                        .css('border-spacing', this.options.boderSpacing)
                        .css('width', '100%')
                        .css('margin','-3px -1px')
        ;
                            
        var tr = $('<tr>');

        for (var i = 0, v = 0, field; (field = this.options.fields[i]) ; i++) {
            var fieldElement = this._createInputElement(field);
            var td = $('<td>').append(fieldElement).attr('colspan', field.span);

            if (!fieldElement) {
                if (field.span && field.span >= this.options.fieldPerRow) {
                    // add a seperator if the row is null
                    td.append($('<hr>').addClass('separator'));
                }
            }

            var span = field.span || 1;

            if (span > this.options.fieldPerRow) {
                throw new Error("span > fieldPerRow");
            }
            var nextV = v + span;

            if (nextV >= this.options.fieldPerRow) {
                if (nextV > this.options.fieldPerRow) {
                    table.append(tr);
                    i--;
                } else {
                    table.append(tr.append(td));
                }

                tr = $('<tr>');
                v = 0;
                continue;
            } else {
                tr.append(td);
            }

            if (i + 1 == this.options.fields.length) {
                table.append(tr.append(td));
                break;
            }

            v += span;
        }

        return $('<div>')
            .append(table)
			.css({
			    'width': '100%',
			    'padding': '3px'
			});
    },
    _createInputElement: function (fieldOption) {
        if (fieldOption.type == 'empty') {
            return null;
        }
        var inputDiv = $('<div>').addClass('w2ui-field');
        var label = $('<label>').text(fieldOption.caption || fieldOption.field);
        var input = this._getInputByType(fieldOption.type).attr('name', fieldOption.field);

        var inputBox = $('<div>').append(input).css({
            
        });

        input.css({
            border: 0
        });

        switch (fieldOption.type) {
            case 'list':
            case 'select':
                inputBox.css({
                    padding: '1px'
                });
                break;
            case 'enum':
                inputBox.css({
                    border: '0',
                    backgroundColor: 'transparent',
                    padding: 0
                });
                input.css({ display: 'none' });
                break;
            default:
                break;
        }

        return inputDiv.append(label).append(inputBox);
    },
    _getInputByType: function (inputType) {
        var tmp = null;
        switch (inputType) {
            case 'textarea':
                tmp = $('<textarea>').css('resize', 'vertical');
                break;
            case 'select':
                tmp = $('<select>');
                break;
            default:
                tmp = $('<input>').attr('type', 'text');
                break;
        }
        if (tmp) {
            tmp.css('width', '100%');
        }
        return tmp;
    }
});