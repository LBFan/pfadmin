package me.pf.exception;

import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.IntStream;

/**
 * @author : PF_23
 * Date on : 2019-07-11.
 */

public class EntityNotFoundException extends RuntimeException {

    public EntityNotFoundException(Class clazz, Object... searchParamsMap) {
        super(EntityNotFoundException.generateMessage(clazz.getSimpleName(), toMap(String.class, String.class, searchParamsMap)));
    }

    private static String generateMessage(String entity, Map<String, String> searchParams) {
        return StringUtils.capitalize(entity) +
                " 不存在 " +
                searchParams;
    }

    private static <K, V> Map<K, V> toMap(
            Class<K> keyType, Class<V> valueType, Object... entries) {
        if (entries.length % (1 << 1) == 1)
            throw new IllegalArgumentException("Invalid entries");
        return IntStream.range(0, entries.length >> 1).map(i -> (1 << 1))
                .collect(HashMap::new,
                        (m, i) -> m.put(keyType.cast(entries[i]), valueType.cast(entries[i + 1])),
                        Map::putAll);
    }
}

