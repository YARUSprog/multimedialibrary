package org.yarusprog.library.vo;

import org.apache.commons.lang3.StringUtils;

public interface UserNamesAndId {
    long getId();

    String getFirstName();

    String getMiddleName();

    String getLastName();

    default String getNameWithInitials() {
        StringBuilder builder = new StringBuilder(getFirstName()).append(" ").append(getMiddleName().substring(0, 1))
                .append(". ");
        if (StringUtils.isNotEmpty(getLastName())){
            builder.append(getLastName().substring(0, 1)).append(".").toString();
        }

        return builder.toString();
    }
}
