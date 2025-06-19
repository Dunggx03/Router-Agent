def best_match(domain: str, domain_list: list[str]) -> str | None:
    """
    Trả về domain khớp tốt nhất (full hoặc subdomain khớp đuôi)
    """
    domain = domain.lower()
    for d in domain_list:
        if domain.endswith(d.lower()):
            return d
    return None
