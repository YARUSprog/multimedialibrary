package org.yarusprog.library.vo;

import java.util.Calendar;
import java.util.Date;

public interface DateOnly {
    Date getUpdateDate();

    default int getYear() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(getUpdateDate());
        return cal.get(Calendar.YEAR);
    }
}
